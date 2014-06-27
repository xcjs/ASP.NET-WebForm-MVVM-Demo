using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using MVVMDemo.Entities;
using MVVMDemo.ViewModels.Account;

namespace MVVMDemo
{
	public partial class _Default : System.Web.UI.Page
	{
		public UserViewModel Model { get; set; }

		protected void Page_Load(object sender, EventArgs e)
		{
			Model = UserViewModel.CreateInstance();
			Model.PropertyChanged += modelUpdated;
		}

		protected void dataUser_OnObjectCreating(object sender, ObjectDataSourceEventArgs e)
		{
			e.ObjectInstance = Model;
		}

		protected void frmUser_OnModeChanging(object sender, FormViewModeEventArgs e)
		{
			switch (e.NewMode)
			{
				case FormViewMode.Edit:
					frmUser.ChangeMode(FormViewMode.Edit);

					if (Model.User == null)
					{
						Model.User = new User();
					}

					break;
			}		
		}

		protected void frmUser_OnItemUpdating(object sender, EventArgs e)
		{
			Button btnSave = (Button)frmUser.FindControl("btnSave");		
			TextBox txtFirstName = (TextBox)frmUser.FindControl("txtFirstName");
			TextBox txtLastName = (TextBox)frmUser.FindControl("txtLastName");
			TextBox txtAddress = (TextBox)frmUser.FindControl("txtAddress");
			TextBox txtAddress2 = (TextBox)frmUser.FindControl("txtAddress2");
			TextBox txtCity = (TextBox)frmUser.FindControl("txtCity");
			TextBox txtState = (TextBox)frmUser.FindControl("txtState");
			TextBox txtZip = (TextBox)frmUser.FindControl("txtZip");

			User user = new User();
			user.ID = Convert.ToInt32(btnSave.CommandArgument);
			user.FirstName = txtFirstName.Text.Trim();
			user.LastName = txtLastName.Text.Trim();
			user.Address = txtAddress.Text.Trim();
			user.Address2 = txtAddress2.Text.Trim();
			user.City = txtCity.Text.Trim();
			user.State = txtState.Text.Trim();
			user.Zip = txtZip.Text.Trim();

			Model.User = user;
		}

		private void modelUpdated(object sender, PropertyChangedEventArgs e)
		{
			frmUser.DataBind();
		}
	}
}
