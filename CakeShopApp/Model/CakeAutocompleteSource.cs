using MaterialDesignExtensions.Model;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

namespace CakeShopApp.Model
{
    public class CakeAutocompleteSource : IAutocompleteSource
    {
        private List<CakeItem> _cakeItems;

        public CakeAutocompleteSource()
        {
            GetCakeItems();
        }

        private void GetCakeItems()
        {
            this._cakeItems = new List<CakeItem>();

            using (var db = new CAKESTOREEntities())
            {
                var cakes = db.CAKEs.ToList();

                cakes.ForEach(c =>
                {
                    this._cakeItems.Add(new CakeItem
                    {
                        Id = c.CAKE_ID,
                        Image = c.IMAGE,
                        Name = c.CAKE_NAME
                    });
                });
            };
        }

        public IEnumerable Search(string searchTerm)
        {
            searchTerm = searchTerm ?? string.Empty;
            searchTerm = searchTerm.ToLower();

            return _cakeItems.Where(item => item.Name.ToLower().Contains(searchTerm));
        }
    }
}
