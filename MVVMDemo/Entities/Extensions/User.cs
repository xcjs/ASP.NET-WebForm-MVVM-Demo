using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace MVVMDemo.Entities
{
	public partial class User
	{
		public static User CreateInstance()
		{
			User user = new User();

			try
			{
				using (var db = new UsersEntities())
				{
					user = db.Users.FirstOrDefault();
				}
			}
			catch (Exception ex)
			{
				Debug.WriteLine("An exception occurred while fetching a User record: " + ex.Message);
			}

			return user;
		}
	}
}