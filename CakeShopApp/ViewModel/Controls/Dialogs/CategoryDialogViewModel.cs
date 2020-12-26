using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CakeShopApp.ViewModel.Controls.Dialogs
{
    public class CategoryDialogViewModel : BaseViewModel
    {
        private CAKE_TYPE _selectedCakeType;
        public CAKE_TYPE SelectedCakeType
        {
            get => this._selectedCakeType;
            set
            {
                this._selectedCakeType = value;

                if (this._selectedCakeType.TYPE_ID == 0)
                {
                    using (var db = new CAKESTOREEntities())
                    {
                        var maxIdCate = db.CAKE_TYPE.OrderByDescending(cake => cake.TYPE_ID).FirstOrDefault();
                        this.SelectedCakeType.TYPE_ID = maxIdCate.TYPE_ID + 1;
                    }
                }
            }
        }
    }
}
