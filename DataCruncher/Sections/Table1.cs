using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataCruncher
{
    public partial class Cruncher
    {
        private void Tabels()
        {
            Printer.PrintSpace();
            Printer.PrintHeader("Tabels");
            string folder = "Tabels";
            Directory.CreateDirectory(folder);
            Tab1(folder);
        }

        private void Tab1(string folder)
        {
            Printer.PrintHeader("Table 1");
            var executions = GetBaselineAndRpfsExecutions(Copy(NonreducedData.DifficultExecutions));


            var baseline = GetBaseLineExecutions(Copy(NonreducedData.DifficultExecutions));
            var baselineVirtualBest = _virtualBestAdder.GetVirtualBest(baseline);
            foreach (var e in baselineVirtualBest)
                e.Strategy = Execution.VirtualBestName + " Standard";

            var allVirtualbest = _virtualBestAdder.GetVirtualBest(executions);
            foreach (var e in allVirtualbest)
                e.Strategy = Execution.VirtualBestName + " All";
            executions.AddRange(baselineVirtualBest);
            executions.AddRange(allVirtualbest);

            var strats = Execution.GetStrategies(executions);
            _statsGenerator.PrintStats(Copy(executions), folder, "Table 1", baseline);
        }
    }
}
