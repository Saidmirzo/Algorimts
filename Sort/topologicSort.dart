


void main(List<String> args) {
  
}
 class TopologicalSort {

    
    enum Color {
        WHITE, GRAY, BLACK
    }

     /*
     * Class to represent vertices
     * */
      class Vertex {
      
        public final String label;

       
        public int weight;

        public int finished;

       
        public Vertex predecessor;

       
        public Color color = Color.WHITE;

      
        public final ArrayList<String> next = new ArrayList<>();

        public Vertex(String label) {
            this.label = label;
        }
     }

     /*
     * Graph class uses the adjacency list representation
     * */
     class Graph {

       
        private final HashMap<String, Vertex> adj = new LinkedHashMap<>();

        public void addEdge(String label, String... next) {
            adj.put(label, new Vertex(label));
            if (!next[0].isEmpty())
                Collections.addAll(adj.get(label).next, next);
        }
    }

    

    /*
     * Time variable in DFS
     * */
     static int time;

    
    public static LinkedList<String> sort(Graph graph) {
        LinkedList<String> list = new LinkedList<>();
        graph.adj.forEach((name, vertex) -> {
            if (vertex.color == Color.WHITE) {
                list.addFirst(sort(graph, vertex, list));
            }
        });
        return list;
    }

    
    private static String sort(Graph graph, Vertex u, LinkedList<String> list) {
        time++;
        u.weight = time;
        u.color = Color.GRAY;
        graph.adj.get(u.label).next.forEach(label -> {
            if (graph.adj.get(label).color == Color.WHITE) {
                graph.adj.get(label).predecessor = u;
                list.addFirst(sort(graph, graph.adj.get(label), list));
            } else if (graph.adj.get(label).color == Color.GRAY) {
                /*
                 * A back edge exists if an edge (u, v) connects a vertex u to its ancestor vertex v
                 * in a depth first tree. If v.d ≤ u.d < u.f ≤ v.f
                 *
                 * In many cases, we will not know u.f, but v.color denotes the type of edge
                 * */
                throw new BackEdgeException("Back edge: " + u.label + " -> " + label);
            }
        });
        u.color = Color.BLACK;
        time++;
        u.finished = time;
        return u.label;
    }
}
 class BackEdgeException extends Exception {

         BackEdgeException(String backEdge) {
            super("This graph contains a cycle. No linear ordering is possible. " + backEdge);
        }

    }
    