using LibrarySystem.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibrarySystem.Web.Admin
{
    public partial class Books : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvEditBooks_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Edit":
                    string id = e.CommandArgument.ToString();
                    Response.Redirect("~/Admin/AddEditBook?id=" + id);
                    break;
                default:
                    break;
            }
        }

        protected void btnAddBook_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/AddEditBook?id=0");
        }

        protected string CutLongString(string input)
        {
            if (!string.IsNullOrEmpty(input) && input.Length > 17)
            {
                return input.Substring(0, 17) + "&hellip;";
            }
            else
            {
                return input;
            }
        }

        protected void btnDeleteBook_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName=="Del")
            {
                int bookId = Convert.ToInt32(this.hfBookId.Value);
                LibraryDbEntities db = new LibraryDbEntities();
                Book book = db.Books.FirstOrDefault(b => b.Id == bookId);
                db.Entry<Book>(book).State = System.Data.Entity.EntityState.Deleted;
                db.SaveChanges();
                this.gvEditBooks.DataBind();
            }
        }
    }
}