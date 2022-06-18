




void main(List<String> args) {
  UnionFind uf = new UnionFind(5);
       print("init /w 5 (should print 'p [0, 1, 2, 3, 4] r [0, 0, 0, 0, 0]'):");
        print(uf);

        uf.union(1, 2);
       print("union 1 2 (should print 'p [0, 1, 1, 3, 4] r [0, 1, 0, 0, 0]'):");
        print(uf);

        uf.union(3, 4);
        print("union 3 4 (should print 'p [0, 1, 1, 3, 3] r [0, 1, 0, 1, 0]'):");
        print(uf);

        uf.find(4);
       print("find 4 (should print 'p [0, 1, 1, 3, 3] r [0, 1, 0, 1, 0]'):");
        print(uf);

        print("count (should print '3'):");
        print(uf.count());
}
 class UnionFind {

    late List<int> p;
    late List<int> r;

     UnionFind(int n) {
        p =List.filled(n, 0);
        r =List.filled(n, 0);

        for (int i = 0; i < n; i++) {
            p[i] = i;
        }
    }

     int find(int i) {
        int parent = p[i];

        if (i == parent) {
            return i;
        }

        return p[i] = find(parent);
    }

     void union(int x, int y) {
        int r0 = find(x);
        int r1 = find(y);

        if (r1 == r0) {
            return;
        }

        if (r[r0] > r[r1]) {
            p[r1] = r0;
        } else if (r[r1] > r[r0]) {
            p[r0] = r1;
        } else {
            p[r1] = r0;
            r[r0]++;
        }
    }

     int count() {
        List parents = [];
        for (int i = 0; i < p.length; i++) {
            if (!parents.contains(find(i))) {
                parents.add(find(i));
            }
        }
        return parents.length;
    }
    @override
     String toString() {
        return "p  $p\nr :$r \n";
    }

    
   
}