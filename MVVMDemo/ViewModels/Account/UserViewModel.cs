using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;

using MVVMDemo.Entities;
using MVVMDemo.ViewModels;

namespace MVVMDemo.ViewModels.Account
{
	public class UserViewModel : ViewModelBase<UserViewModel>, ISaveableViewModel
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

		public bool Save()
		{
			bool saved = false;

			try
			{
				using(var db = new UsersEntities())
				{
					if(User.ID > 0)
					{
						db.Users.AddObject(User);
					}
					else
					{
						User user = db.Users.FirstOrDefault(u => u.ID == User.ID);

						if(user != null)
						{
							user = User;
						}
					}

					if(db.SaveChanges() > 0)
					{
						 saved = true;
					}
				}
			}
			catch(Exception ex)
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