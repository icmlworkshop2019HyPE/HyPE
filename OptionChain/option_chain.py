import os, glob
from Environments.multioption import MultiOption


class OptionNode():
    def __init__(self, name, edges):
        self.name = name
        self.edges = edges

    def add_edge(edge):
        self.edges.append(edge)

class OptionChain():
    def __init__(self, base_environment, save_path, train_edge):
        '''
        OptionChain should contain all of the requisite information, which is a sequence of proxy environments
        edges are stored in 
        TODO: proxy environments depend on the path to reach a proxy environment, which would have overlap.
            replace redundant overlap
        '''
        # self.nodes = nodes #{"Action": true_environment}
        # self.edges = edges #[]
        self.environments = dict()
        self.save_path = save_path
        self.base_environment = base_environment
        self.edges = []
        self.nodes = dict()
        try:
            os.makedirs(save_path)
        except OSError:
            print("existing paths already")
            dirs = [d.split("/")[-1] for d in glob.glob(os.path.join(save_path, '*'))]
            # TODO: currently loads all edges, though this has the potential to be unwieldy
            print(dirs)
            for d in dirs:
                edge = (d.split("->")[0], d.split("->")[1])
                self.add_edge(edge)
                if d != train_edge: # the train edge does not need to load
                    model_path = os.path.join(save_path, d)
                    models = MultiOption()
                    models.load(model_path)
                    proxy_env = load_from_pickle(os.path.join(save_path, d, "env.pkl"))
                    proxy_env.set_models(models)
                    self.environments[edge] = proxy_env

    def initialize(self, args):
        '''
        TODO: make this generalizable to other cases.
        '''
        '''
        Dijkstra's algorithm for the shortest path for control. Alternatively, we might return all paths
        '''
        path = []
        print(self.nodes)
        object_distances = {obj.name: 9999999 for obj in self.nodes.values()} # set to a big number
        object_backpointers = {obj.name: None for obj in self.nodes.values()} # only one backpointer
        frontier = {'Action': 0}
        visited = set()
        object_distances['Action'] = 0
        while len(frontier) > 0:
            lowest_kv = (None, 9999999)
            for (key, value) in frontier.items():
                if lowest_kv[1] > value:
                    lowest_kv = (key,value)
            visited.add(lowest_kv[0])
            for edge in self.edges:
                if edge[0] == lowest_kv[0] and edge[1] not in visited:
                    print(object_distances)
                    # print("check", edge, lowest_kv, visited, object_distances[edge[0]])
                    if lowest_kv[1] + 1 < object_distances[edge[1]]:
                        object_distances[edge[1]] = lowest_kv[1] + 1
                        frontier[edge[1]] = lowest_kv[1] + 1
                        print(edge)
                        object_backpointers[edge[1]] = edge
            frontier.pop(lowest_kv[0])
        
        env_order = []
        n_edge = (args.train_edge.split('->')[0], args.train_edge.split('->')[1])
        object_order = [n_edge[1]]
        object_at = n_edge[0]
        env_order = []
        while object_at != 'Action':
            env_order = [self.environments[n_edge]] + env_order
            n_edge = object_backpointers[object_at]
            object_order = [n_edge[0]] + object_order
            object_at = n_edge[0]
        env_order = [self.base_environment] + env_order
        return env_order

    def add_edge(self, edge):
        self.edges.append(edge)
        for tailnode in edge[0].split("_"):
            if tailnode in self.nodes:
                self.nodes[tailnode].add_edge(edge)
            else:
                self.nodes[tailnode] = OptionNode (tailnode, [edge])
        if edge[1] not in self.nodes: # add the head if it does not exist
            self.nodes[edge[1]] = OptionNode(edge[1], [])
