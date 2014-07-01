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

	    private void SetSkillsVisibility()
	    {
            if (Model == null || Model.User == null)
                lvSkills.Visible = false;
            else if (Model.User.ID == 0)
                lvSkills.Visible = false;
            else
                lvSkills.Visible = true;	        
	    }

		protected void Page_Load(object sender, EventArgs e)
		{
			Model = UserViewModel.CreateInstance();
			Model.PropertyChanged += modelUpdated;
		    SetSkillsVisibility();
		}

	    protected void dataUser_OnObjectCreating(object sender, ObjectDataSourceEventArgs e)
		{
			e.ObjectInstance = Model;
            SetSkillsVisibility();
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

		private void modelUpdated(object sender, PropertyChangedEventArgs e)
		{
		    frmUser.DataBind();
		}
	}
}
