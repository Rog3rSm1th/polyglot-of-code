import java.util.Scanner;
import java.io.File;

public class Day15 {
    // Ingredients
    static int[][] INPUT = new int[4][5];
    
    static int[] TOTAL = new int[4];

    public static void main(String[] args) {
        try {
            Scanner scanner = new Scanner(new File("input.txt"));
            String line;
            for (int lineIndex = 0; scanner.hasNextLine(); lineIndex++) {
                line = scanner.nextLine();
                String[] tmp = line.split(" ");
                for (int i = 1; i < 5; i++) { 
                     INPUT[lineIndex][i - 1] = Integer.parseInt(tmp[i * 2].substring(0, tmp[i * 2].length() - 1));
                } 
                INPUT[lineIndex][4] = Integer.parseInt(tmp[10]);
            }
            scanner.close();
            // Solve the challenge
            long beginning = System.currentTimeMillis();
            int result = solve();
            System.out.println(result);
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    static int value(int first, int second, int third, int fourth) {
        for (int i = 0; i < 4; i++) {
            TOTAL[i] = Math.max(first * INPUT[0][i] + second * INPUT[1][i] + third * INPUT[2][i] + fourth * INPUT[3][i], 0);
        }
        int result = TOTAL[0] * TOTAL[1] * TOTAL[2] * TOTAL[3];
        return result;
    }

    // Total score of the highest-scoring cookie
    static int solve() {
        int highestScoringCookie = 0;
        int val = 0;
        for (int a = 0; a <= 100; a++) {
            for (int b = 0; b <= 100 - a; b++) {
                for (int c = 0; c <= 100 - a - b; c++) {
                    val = value(a, b, c, 100 - a - b - c);
                    if (val > highestScoringCookie) {
                        highestScoringCookie = val;
                    }
                }
            }
        }
        return highestScoringCookie;
    }
    
}
