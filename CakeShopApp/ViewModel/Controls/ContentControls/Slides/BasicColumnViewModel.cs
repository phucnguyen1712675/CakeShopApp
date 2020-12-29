using CakeShopApp.Utils;
using CakeShopApp.View;
using DrWPF.Windows.Data;
using LiveCharts;
using LiveCharts.Wpf;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace CakeShopApp.ViewModel.Controls.ContentControls.Slides
{
    public class BasicColumnViewModel : BaseViewModel
    {
        public ObservableDictionary<string, SeriesCollection> ChartDictinary { get; set; }
        public string[] Labels { get; set; }
        public Func<double, string> Formatter { get; set; }
        public int SelectedIndex { get; set; }
        private ICommand _backHomeCommand { get; set; }
        public ICommand BackHomeCommand => _backHomeCommand ?? (_backHomeCommand = new CommandHandler((param) => BackHomeAction(), () => CanExecute));

        public BasicColumnViewModel()
        {
            GetChartDictinary();

            //Get all months name
            Labels = DateTimeFormatInfo.CurrentInfo.MonthNames;
            Labels = Labels.Take(Labels.Count() - 1).ToArray();

            CultureInfo cul = CultureInfo.GetCultureInfo("vi-VN");   // try with "en-US"
            Formatter = value => (value != 0.0 ? value.ToString("#,###", cul.NumberFormat) : "0.000") + " đồng";
        }

        private void GetChartDictinary()
        {
            this.ChartDictinary = new ObservableDictionary<string, SeriesCollection>();

            using (var db = new CAKESTOREEntities())
            {
                //Get orders list
                var ordersList = db.ORDERS.ToList();
                //Get date list from order list
                var dateList = ordersList.Select(o => o.DATE_CREATE.Value).ToList();
                //Get max date
                var maxDate = dateList.Max();
                //Get min date
                var minDate = dateList.Min();
                //Get year range (e.g 2019, 2020)
                var yearRange = GetYearRange(minDate, maxDate);

                if (yearRange.Count != 0)
                {
                    //For each year
                    yearRange.ForEach(y =>
                    {
                        // Get order list of that year
                        var ordersOfYearY = ordersList.Where(o => o.DATE_CREATE.Value.Year == y).ToList();

                        if (ordersOfYearY.Count != 0)
                        {
                            //A dictionary with key-value pair = <month, revenue of that month> 
                            var orderDictionary = new Dictionary<int, double>();
                            //Initialize month of a year range
                            var months = Enumerable.Range(1, 12);

                            //For each month of a year
                            foreach (var month in months)
                            {
                                //Get order profit list of that month
                                var orderProfitOfThisMonthList = ordersOfYearY.Where(o => o.DATE_CREATE.Value.Month == month).Select(o => (double)o.TOTAL_PRICE).ToList();
                                //Calculate sum profit of that month
                                var profitOfThisMonth = orderProfitOfThisMonthList.Sum();
                                //Add to dictinary
                                orderDictionary.Add(month, profitOfThisMonth);
                            }

                            //A chart values for chart (expeted 12 double value corresponding to 12 month of year)
                            var chartValues = new ChartValues<double>();

                            //For each value in dictionary
                            foreach (var item in orderDictionary.Values)
                            {
                                //Add value to chart values
                                chartValues.Add(item);
                            }

                            //Initialize a seriessCollection corresponding to chart of that year
                            var seriesCollection = new SeriesCollection
                            {
                                //Initialize a column series corresponding to revenue of each month of a year
                                new ColumnSeries
                                {
                                    //Year
                                    Title = y.ToString(),
                                    //Chart values for each month of that year
                                    Values = chartValues
                                }
                            };

                            //Add to chart dictionary
                            this.ChartDictinary.Add(y.ToString(), seriesCollection);
                        }
                    });
                }
            };
            this.SelectedIndex = ChartDictinary.Count - 1;
        }

        public static List<int> GetYearRange(DateTime startingDate, DateTime endingDate)
        {
            var allYears = new List<int>();

            for (int year = startingDate.Year; year <= endingDate.Year; year++)
            {
                allYears.Add(year);
            }

            return allYears;
        }

        public bool CanExecute => true;

        private void BackHomeAction() => MainWindow.Instance.SetContentControl(new HomeScreenViewModel());
    }
}
