using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LibrarySystem.Data;

namespace LibrarySystem.Web
{
    public partial class Search : System.Web.UI.Page
    {
        private string query;
        public string Query
        {
            get
            {
                return query;
            }
            set
            {
                query = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Query = Request.Params["q"] == null ? "" : Request.Params["q"].ToString();
            this.h3SearchResultsTitle.InnerText = "Search Results for " + this.Query;
            LibraryDbEntities data = new LibraryDbEntities();
            IEnumerable<Book> books = null;
            if (!string.IsNullOrEmpty(this.Query))
            {
                books = data.Books
                    .Where(b => b.Title.Contains(this.Query) || b.Author.Contains(this.Query))
                    .OrderBy(b => b.Title)
                    .ToList();
            }
            else
            {
                books = data.Books.OrderBy(b => b.Title).ToList();
            }
            this.lvSearchBooks.DataSource = books;
            this.lvSearchBooks.DataBind();
        }
    }
}