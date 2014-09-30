using LibrarySystem.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibrarySystem.Web.Admin
{
    public partial class Categories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.mvEditCreateCategories.Visible = false;
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            this.gvEditcategories.DataBind();
        }

        protected void btnSaveCategory_Click(object sender, EventArgs e)
        {
            LibraryDbEntities db = new LibraryDbEntities();
            Category cat = new Category();
            string name = this.txtCategoryName.Text;
            cat.Name = name;
            db.Categories.Add(cat);
            db.SaveChanges();
            this.txtCategoryName.Text = "";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            this.txtCategoryName.Text = "";
        }

        protected void btnCreateCategory_Click(object sender, EventArgs e)
        {
            this.mvEditCreateCategories.ActiveViewIndex = 0;
            this.mvEditCreateCategories.Visible = true;
            this.txtCategoryName.Focus();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Category cat = new Category()
            {
                Id = Convert.ToInt32(this.hfCategoryId.Value),
                Name = this.txtEditCategoryName.Text
            };
            LibraryDbEntities db = new LibraryDbEntities();
            db.Entry<Category>(cat).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
        }

        protected void gvEditcategories_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Edit":
                    string[] parameters = e.CommandArgument.ToString().Split(';');
                    this.hfCategoryId.Value = parameters[0];
                    this.txtEditCategoryName.Text = parameters[1];
                    this.txtEditCategoryName.Focus();
                    this.mvEditCreateCategories.ActiveViewIndex = 1;
                    this.mvEditCreateCategories.Visible = true;
                    break;
                case "Del":
                    parameters = e.CommandArgument.ToString().Split(';');
                    this.hfCategoryIdDel.Value = parameters[0];
                    this.lblCategoryNameDel.Text = parameters[1];
                    this.mvEditCreateCategories.ActiveViewIndex = 2;
                    this.mvEditCreateCategories.Visible = true;
                    break;
                default:
                    break;
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Category cat = new Category()
            {
                Id = Convert.ToInt32(this.hfCategoryIdDel.Value),
            };
            LibraryDbEntities db = new LibraryDbEntities();
            db.Entry<Category>(cat).State = System.Data.Entity.EntityState.Deleted;
            db.SaveChanges();
        }

    }
}