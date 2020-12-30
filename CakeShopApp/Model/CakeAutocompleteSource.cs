using MaterialDesignExtensions.Model;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;

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
            searchTerm = RemoveDiacritics(searchTerm);

            return _cakeItems.Where(item => RemoveDiacritics(item.Name.ToLower()).Contains(searchTerm));
        }

        private string RemoveDiacritics(string text) 
            => string.Concat(text.Normalize(NormalizationForm.FormD)
                     .Where(ch => CharUnicodeInfo.GetUnicodeCategory(ch) != UnicodeCategory.NonSpacingMark))
                     .Normalize(NormalizationForm.FormC);
    }
}
