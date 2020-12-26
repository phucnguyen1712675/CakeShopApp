using CakeShopApp.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using System.Collections.ObjectModel;

namespace CakeShopApp.ViewModel.Controls.Dialogs
{
    public class DetailDialogViewModel : BaseViewModel
    {
        public CAKE SelectedCake { get; set; }
        public ObservableCollection<CAKE_TYPE> CakeCategories { get; set; }
        public int SelectedIndex { get; set; }
        public ICommand SelectImageCommand => new AnotherCommandImplementation(ExecuteOpenFileDialog);

        public DetailDialogViewModel()
        {
            using (var db = new CAKESTOREEntities())
            {
                db.CAKE_TYPE.ToList().ForEach(cate =>
                {
                    CakeCategories.Add(cate);
                });
            };
            this.SelectedIndex = CakeCategories.IndexOf(this.SelectedCake.CAKE_TYPE1);
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
