using System;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;

namespace Day8
{
    internal class Part1
    {
        private static void Main()
        {
            var result = solve();
            Console.Out.WriteLine(result);
        }

        // Solving the part 1
        private static int solve() {
          var lines = File.ReadAllLines("input.txt");
          var result = lines.Sum(line => line.Length - Regex.Replace(line.Trim('"').Replace("\\\"", "Z").Replace("\\\\", "Z"), "\\\\x[a-f0-9]{2}", "Z").Length);
          return result;
        }
    }
}