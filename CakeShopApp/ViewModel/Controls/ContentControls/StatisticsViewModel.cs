using CakeShopApp.ViewModel.Controls.ContentControls.Slides;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CakeShopApp.ViewModel.Controls.ContentControls
{
    public class StatisticsViewModel : BaseViewModel
    {
        public BasicColumnViewModel BasicColumnViewModel { get; set; }
        public PieChartViewModel PieChartViewModel { get; set; }
        public int SelectedIndex { get; set; }

        public StatisticsViewModel()
        {
            this.BasicColumnViewModel = new BasicColumnViewModel();
            this.PieChartViewModel = new PieChartViewModel();
            this.SelectedIndex = 0;
        }
    }
}
