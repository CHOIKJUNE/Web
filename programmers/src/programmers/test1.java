package programmers;

import java.util.HashSet;

public class test1 {

	public static int solution(int left, int right) {
        HashSet<Integer> set = new HashSet<>();
        int i = left;
        //약수의 개수의 합
        int num = 0;
        while(i<=right) {
            for(int j=1; j<=i; j++) {
                for(int k=1; k<=i; k++) {
                    if(j*k==left) {
                        set.add(j);
                        set.add(k);
                    }
                }
            }
            int size = set.size()%2==0 ? set.size() : -1*set.size();
            num += size;
            i++;
        }
        return num;
	}
	public static void main(String[] args) {
		int num = test1.solution(14, 17);
	}

}
