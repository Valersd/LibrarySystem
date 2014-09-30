using LibrarySystem.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibrarySystem.Web.Admin
{
    public partial class EditBook : System.Web.UI.Page
    {
        private int bookId;

        protected int BookId
        {
            get { return bookId; }
            set { bookId = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.BookId = Convert.ToInt32(Request.Params["id"]);
            if (this.BookId == 0)
            {
                this.h2Title.InnerText = "Add Book";
                this.btnUpdate.Visible = false;
            }
            else
            {
                this.h2Title.InnerText = "Edit Book";
                this.btnAdd.Visible = false;
                
            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (this.BookId != 0)
            {
                LibraryDbEntities db = new LibraryDbEntities();
                Book book = db.Books.FirstOrDefault(b => b.Id == this.BookId);
                this.txtTitle.Text = book.Title;
                this.txtAuthor.Text = book.Author;
                this.txtIsbn.Text = book.ISBN;
                this.txtUrl.Text = book.Url;
                this.txtDescription.Text = book.Description;
                this.ddlCategories.SelectedValue = book.CategoryId.ToString();

            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Book book = new Book()
            {
                Id = this.BookId,
                Title = txtTitle.Text,
                Author = txtAuthor.Text,
                ISBN = txtIsbn.Text != "" ? txtIsbn.Text : null,
                Url = txtUrl.Text != "" ? txtUrl.Text : null,
                Description = txtDescription.Text != "" ? txtDescription.Text : null,
                CategoryId = Convert.ToInt32(this.ddlCategories.SelectedValue)
            }; 
            LibraryDbEntities db = new LibraryDbEntities();
            db.Entry<Book>(book).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            Response.Redirect("~/Admin/Books.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/Books.aspx");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Book book = new Book()
            {
                Title = txtTitle.Text,
                Author = txtAuthor.Text,
                ISBN = txtIsbn.Text != "" ? txtIsbn.Text : null,
                Url = txtUrl.Text != "" ? txtUrl.Text : null,
                Description = txtDescription.Text != "" ? txtDescription.Text : null,
                CategoryId = Convert.ToInt32(this.ddlCategories.SelectedValue)
            };
            LibraryDbEntities db = new LibraryDbEntities();
            db.Entry<Book>(book).State = System.Data.Entity.EntityState.Added;
            db.SaveChanges();
            Response.Redirect("~/Admin/Books.aspx");
        }
    }
}