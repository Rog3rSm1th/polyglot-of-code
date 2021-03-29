using System;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;

namespace Day8
{
    internal class Part2
    {
        private static void Main()
        {
            var result = solve();
            Console.Out.WriteLine(result);
        }

        // Solving the part 2
        private static int solve() {
          var lines = File.ReadAllLines("input.txt");
          var result = lines.Sum(line => line.Replace("\\", "ZZ").Replace("\"", "ZZ").Length + 2 - line.Length);
          return result;
        }
    }
}