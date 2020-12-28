using CakeShopApp.Utils;
using CakeShopApp.View;
using CakeShopApp.View.Controls.Dialogs;
using CakeShopApp.ViewModel.Controls.Dialogs;
using DrWPF.Windows.Data;
using LiveCharts;
using LiveCharts.Wpf;
using MaterialDesignThemes.Wpf;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Input;

namespace CakeShopApp.ViewModel.Controls.ContentControls.Slides
{
    public class PieChartViewModel : BaseViewModel
    {
        public SeriesCollection SeriesCollection { get; set; }
        public DateTime FromDate { get; set; }
        public DateTime ToDate { get; set; }
        public CalendarPickerViewModel CalendarPickerViewModel { get; set; }
        public ICommand RunFromDatePickerDialogCommand => new AnotherCommandImplementation(ExecuteFromDatePickerDialog);
        public ICommand RunToDatePickerDialogCommand => new AnotherCommandImplementation(ExecuteToDatePickerDialog);
        private ICommand _backHomeCommand { get; set; }
        public ICommand BackHomeCommand => _backHomeCommand ?? (_backHomeCommand = new CommandHandler((param) => BackHomeAction(), () => CanExecute));

        public PieChartViewModel()
        {
            using (var db = new CAKESTOREEntities())
            {
                //Get orders list
                var ordersList = db.ORDERS.ToList();
                //Get cate name list
                var cateNameList = db.CAKE_TYPE.ToList();
                //Get min date in order list
                var minDate = ordersList.Select(o => o.DATE_CREATE.Value).Min();
                //Get max date in order list
                var maxDate = ordersList.Select(o => o.DATE_CREATE.Value).Max();

                //Check valid date range
                if (IsValidDateRange(minDate, maxDate))
                {
                    //Set date range
                    this.FromDate = minDate;
                    this.ToDate = maxDate;
                }
            };

            GetSeriesCollection();
        }

        private void GetSeriesCollection()
        {
            this.SeriesCollection = new SeriesCollection();

            using (var db = new CAKESTOREEntities())
            {
                //Get orders list
                var ordersList = db.ORDERS.ToList();
                //Get cate name list
                var cateNameList = db.CAKE_TYPE.ToList();
                //Get orders in this date range
                var ordersToStatisticsList = ordersList.Where(o => IsDateInDateRange(o.DATE_CREATE.Value)).ToList();
                //A dictionary with key-value pair = <cake-type, revenue of that cake-type> 
                var orderDictionary = new Dictionary<CAKE_TYPE, double>();

                //For each cate
                cateNameList.ForEach(cate =>
                {
                    //Get orders that contains cake type equals this cate
                    var orderContainsThisCateList = ordersToStatisticsList.Where(o => o.CAKE_IN_ORDERS.ToList().Any(c => c.CAKE.CAKE_TYPE == cate.TYPE_ID)).ToList();
                    //Get cake in orders Collection list from above orders
                    var cakeInOrdersCollectionList = orderContainsThisCateList.Select(o => o.CAKE_IN_ORDERS).ToList();
                    //Initialize cake in orders list that cotain cake equals this cate
                    var cakeInOrdersList = new List<CAKE_IN_ORDERS>();

                    //Get cake in orders list from above orders
                    cakeInOrdersCollectionList.ForEach(cakeInOrderCollection =>
                    {
                        foreach (var cakeInOrder in cakeInOrderCollection)
                        {
                            if (cakeInOrder.CAKE.CAKE_TYPE == cate.TYPE_ID)
                            {
                                cakeInOrdersList.Add(cakeInOrder);
                            }
                        }
                    });

                    //Initialize revenue list that cotain renenue from each cake in orders from above list
                    var revenueList = new List<double>();

                    // Calculate revenue list
                    cakeInOrdersList.ForEach(cakeInOrder =>
                    {
                        var cakePrice = (double)cakeInOrder.CAKE.PRICE;
                        var cakeAmount = (int)cakeInOrder.NUMBER;
                        var proceeds = cakePrice * cakeAmount;
                        revenueList.Add(proceeds);
                    });

                    //Get total proceeds of this cate
                    var sum = revenueList.Sum();
                    //Add to order dictinary
                    orderDictionary.Add(cate, sum);
                });

                foreach (var item in orderDictionary)
                {
                    this.SeriesCollection.Add(new PieSeries
                    {
                        Title = item.Key.TYPE_NAME,
                        Values = new ChartValues<double> { item.Value }
                    });
                }
            };
        }

        public bool CanExecute => true;

        private void BackHomeAction() => MainWindow.Instance.SetContentControl(new HomeScreenViewModel());

        private bool IsDateInDateRange(DateTime date) => this.FromDate <= date && date <= this.ToDate;

        private bool IsValidDateRange(DateTime fromDate, DateTime toDate) => fromDate <= toDate;

        #region

        private void ExtendedOpenedEventHandler(object sender, DialogOpenedEventArgs eventargs)
            => Console.WriteLine("You could intercept the open and affect the dialog using eventArgs.Session.");

        private async void ExecuteFromDatePickerDialog(object obj)
        {
            this.CalendarPickerViewModel = new CalendarPickerViewModel
            {
                SelectedDate = this.FromDate
            };

            var view = new CalendarPickerControl
            {
                DataContext = this.CalendarPickerViewModel
            };

            //show the dialog
            var result = await DialogHost.Show(view, MainWindowViewModel.Instance.Identifier, ExtendedOpenedEventHandler, FromDatePickerDialogClosingEventHandler);

            //check the result...
            Console.WriteLine("Dialog was closed, the CommandParameter used to close it was: " + (result ?? "NULL"));
        }

        private async void ExecuteToDatePickerDialog(object obj)
        {
            this.CalendarPickerViewModel = new CalendarPickerViewModel
            {
                SelectedDate = this.ToDate
            };

            var view = new CalendarPickerControl
            {
                DataContext = this.CalendarPickerViewModel
            };

            //show the dialog
            var result = await DialogHost.Show(view, MainWindowViewModel.Instance.Identifier, ExtendedOpenedEventHandler, ToDatePickerDialogClosingEventHandler);

            //check the result...
            Console.WriteLine("Dialog was closed, the CommandParameter used to close it was: " + (result ?? "NULL"));
        }

        private void FromDatePickerDialogClosingEventHandler(object sender, DialogClosingEventArgs eventArgs)
        {
            if (eventArgs.Parameter is bool parameter &&
                parameter == false) return;

            if (IsValidDateRange(this.CalendarPickerViewModel.SelectedDate, this.ToDate))
            {
                this.FromDate = this.CalendarPickerViewModel.SelectedDate;
                GetSeriesCollection();
            }
            else
            {
                MessageBox.Show("Not valid date");
            }
        }

        private void ToDatePickerDialogClosingEventHandler(object sender, DialogClosingEventArgs eventArgs)
        {
            if (eventArgs.Parameter is bool parameter &&
                parameter == false) return;

            if (IsValidDateRange(this.FromDate, this.CalendarPickerViewModel.SelectedDate))
            {
                this.ToDate = this.CalendarPickerViewModel.SelectedDate;
                GetSeriesCollection();
            }
            else
            {
                MessageBox.Show("Not valid date");
            }
        }

        #endregion
    }
}
