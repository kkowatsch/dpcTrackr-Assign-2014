using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace dpcTrackr
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            UserStore<IdentityUser> userStore = new UserStore<IdentityUser>();
            UserManager<IdentityUser> manager = new UserManager<IdentityUser>(userStore);

            IdentityUser newUser = new IdentityUser(txtUserName.Text);
            IdentityResult idResult = manager.Create(newUser, txtPassword.Text);

            if (idResult.Succeeded)
            {
                RoleStore<IdentityRole> roleStore = new RoleStore<IdentityRole>();
                RoleManager<IdentityRole> roleMgr = new RoleManager<IdentityRole>(roleStore);
                
                if (rblRole.SelectedValue == "Worker")
                {
                    if (!roleMgr.RoleExists("Worker"))
                    {
                        IdentityResult roleResult = roleMgr.Create(new IdentityRole("Worker"));
                    }
                    //now create the user as shown in previous examples
                    //which gives you the newUser object of type IdentityUser…

                    IdentityResult userResult = manager.AddToRole(newUser.Id, "Worker");
                    //now your newUser is in that role, you can log them in and redirect!
                }
                else if (rblRole.SelectedValue == "Designer")
                {
                    if (!roleMgr.RoleExists("Designer"))
                    {
                        IdentityResult roleResult = roleMgr.Create(new IdentityRole("Designer"));
                    }
                    //now create the user as shown in previous examples
                    //which gives you the newUser object of type IdentityUser…

                    IdentityResult userResult = manager.AddToRole(newUser.Id, "Designer");
                    //now your newUser is in that role, you can log them in and redirect!
                }
                else if (rblRole.SelectedValue == "Manager")
                {
                    if (!roleMgr.RoleExists("Manager"))
                    {
                        IdentityResult roleResult = roleMgr.Create(new IdentityRole("Manager"));
                    }
                    //now create the user as shown in previous examples
                    //which gives you the newUser object of type IdentityUser…

                    IdentityResult userResult = manager.AddToRole(newUser.Id, "Manager");
                    //now your newUser is in that role, you can log them in and redirect!
                }
                lblFeedback.Text = "User " + /*newUser.UserName +*/
                              " was created successfully!";
                var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;

                var userIdentity = manager.CreateIdentity(newUser, DefaultAuthenticationTypes.ApplicationCookie);

                authenticationManager.SignIn(userIdentity);

                Response.Redirect("~/Landing/index.html");
            }
        }
    }
}