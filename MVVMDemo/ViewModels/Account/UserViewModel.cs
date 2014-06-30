using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;

using MVVMDemo.Entities;
using MVVMDemo.ViewModels;

namespace MVVMDemo.ViewModels.Account
{
	public class UserViewModel : ViewModelBase<UserViewModel>
	{
		private User _user;
		public User User
		{
			get
			{
				return _user;
			}
			set
			{
				_user = value;
				NotifyPropertyChanged("User");
			}
		}

		public UserViewModel() { }

		public bool SaveUser(User updatedUser)
		{
			bool saved = false;

			User = new User();

			User.ID = updatedUser.ID;
			User.FirstName = updatedUser.FirstName.Trim();
			User.LastName = updatedUser.LastName.Trim();
			User.Address = updatedUser.Address.Trim();
			User.Address2 = updatedUser.Address2.Trim();
			User.City = updatedUser.City.Trim();
			User.State = updatedUser.State.Trim();
			User.Zip = updatedUser.Zip.Trim();

			try
			{
				using (var db = new UsersEntities())
				{
					User existingUser = db.Users.FirstOrDefault(u => u.ID == User.ID);

					if (existingUser != null)
					{
						existingUser.FirstName = User.FirstName;
						existingUser.LastName = User.LastName;
						existingUser.Address = User.Address;
						existingUser.Address2 = User.Address2;
						existingUser.City = User.City;
						existingUser.State = User.State;
						existingUser.Zip = User.Zip;
					}
					else
					{
						db.Users.AddObject(User);
					}

					if (db.SaveChanges() > 0)
					{
						saved = true;
					}
				}
			}
			catch (Exception ex)
			{
				Debug.WriteLine("AN exception occurred while saving User changes: " + ex.Message);
			}

			return saved;
		}

		public static UserViewModel CreateInstance()
		{
			UserViewModel m = new UserViewModel();
			m.User = User.CreateInstance();

			return m;
		}
	}
}
