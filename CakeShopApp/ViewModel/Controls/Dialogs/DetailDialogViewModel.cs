using CakeShopApp.Utils;
using System.Linq;
using System.Windows.Forms;
using System.Windows.Input;
using System.Collections.ObjectModel;

namespace CakeShopApp.ViewModel.Controls.Dialogs
{
    public class DetailDialogViewModel : BaseViewModel
    {
        private CAKE _selectedCake;
        public CAKE SelectedCake
        {
            get => this._selectedCake;
            set
            {
                this._selectedCake = value;

                if (this._selectedCake.CAKE_ID == 0)
                {
                    using (var db = new CAKESTOREEntities())
                    {
                        var maxIdCake = db.CAKEs.OrderByDescending(cake => cake.CAKE_ID).FirstOrDefault();
                        this.SelectedCake.CAKE_ID = maxIdCake.CAKE_ID + 1;
                    }
                }

                //Check if item exists
                if (CakeCategories.Any(f => f.TYPE_ID == this._selectedCake.CAKE_TYPE))
                {
                    //If it does, get item
                    var cate = CakeCategories.FirstOrDefault(f => f.TYPE_ID == this._selectedCake.CAKE_TYPE);
                    //grab its index
                    SelectedIndex = CakeCategories.IndexOf(cate);
                }
                else
                {
                    SelectedIndex = 0;
                }
            }
        }
        public ObservableCollection<CAKE_TYPE> CakeCategories { get; set; }
        public int SelectedIndex { get; set; }
        public ICommand SelectImageCommand => new AnotherCommandImplementation(ExecuteOpenFileDialog);

        public DetailDialogViewModel()
        {
            CakeCategories = new ObservableCollection<CAKE_TYPE>();

            using (var db = new CAKESTOREEntities())
            {
                db.CAKE_TYPE.ToList().ForEach(cate =>
                {
                    CakeCategories.Add(cate);
                });
            };
        }

        private void ExecuteOpenFileDialog(object obj)
        {
            var fileDialog = new OpenFileDialog
            {
                Filter = "Images (*.BMP;*.JPG;*.GIF)|*.BMP;*.JPG;*.GIF|" +
                                 "All files (*.*)|*.*",
                Title = "Chọn ảnh mới"
            };
            DialogResult dr = fileDialog.ShowDialog();

            if (dr == DialogResult.OK)
            {
                this.SelectedCake.IMAGE = fileDialog.FileName;
            }
        }
    }
}
