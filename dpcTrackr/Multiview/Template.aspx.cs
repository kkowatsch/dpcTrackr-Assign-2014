using dpcTrackr;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using dpcTrackr.DesignBidDataSetTableAdapters;
using System.Data.SqlClient;

namespace WebApplication1
{

    public partial class WebForm1 : System.Web.UI.Page
    {
        DesignBidDataSet ds = new DesignBidDataSet();
        DataTable tempGrid = new DataTable();
        bool editing = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            //setup initial gridviews blank rows
            tempGrid.Columns.Add("Qty", typeof(int));
            tempGrid.Columns.Add("Desc", typeof(string));
            tempGrid.Columns.Add("Unit Price", typeof(int));
            tempGrid.Columns.Add("Extended Price", typeof(int));
            tempGrid.Columns.Add("Size", typeof(int));
            tempGrid.Columns.Add("Size (dim)", typeof(string));
            tempGrid.Columns.Add("1", typeof(string));
            tempGrid.Columns.Add("2", typeof(string));
            tempGrid.Columns.Add("3", typeof(string));
            tempGrid.Columns.Add("4", typeof(string));
            tempGrid.Rows.Add(0, "", 0, 0, 0, "", "", "", "", "");

            gvPlant.DataSource = tempGrid;
            gvPlant.DataBind();
            
            if(!Page.IsPostBack)
            {
            }

            mvButtons.Visible = false;

            // How to hide buttons based on roles

            if (User.Identity.IsAuthenticated)
            {
                List<string> itemstoRemove = new List<string>();

                itemstoRemove.Add("Design");
                itemstoRemove.Add("Production");
                itemstoRemove.Add("Manager");
                itemstoRemove.Add("Worker");

                if (User.IsInRole("Worker"))
                    itemstoRemove.Remove("Worker");

                else if (User.IsInRole("Designer"))
                {
                    itemstoRemove.Remove("Design");
                }

                else if (User.IsInRole("Manager"))
                {
                    itemstoRemove.Remove("Manager");
                    itemstoRemove.Remove("Production");
                    itemstoRemove.Remove("Design");
                    itemstoRemove.Remove("Worker");
                }


                else if (User.IsInRole("ProductionManager"))
                {
                    itemstoRemove.Remove("Production");
                }

                MenuItem toRemove = new MenuItem();
                foreach (string x in itemstoRemove)
                {

                    toRemove = NavigationMenu.FindItem(x);
                    if (toRemove != null)
                    {
                        NavigationMenu.Items.Remove(toRemove);
                    }

                }
            }
            else
            {
                Response.Redirect("~/Login/Login.aspx");
            }
        }

        protected void MultiView1_ActiveViewChanged(object sender, EventArgs e)
        {
           
        }

        protected void NavigationMenu_MenuItemClick(object sender, MenuEventArgs e)
        {
            mvButtons.Visible = true;


            if (NavigationMenu.SelectedValue == "Design")
            {
                mvMain.SetActiveView(vBlank);
                mvButtons.SetActiveView(vbDesigner);

            }

            else if (NavigationMenu.SelectedValue == "Worker")
            {
                mvMain.SetActiveView(vWorkReport);
                mvButtons.Visible = false;
            }
            else if (NavigationMenu.SelectedValue == "Production")
            {

                mvButtons.SetActiveView(vbProduction);
                mvMain.SetActiveView(vBlank);

            }
            else if (NavigationMenu.SelectedValue == "Manager")
            {
                mvMain.SetActiveView(vBlank);
                mvButtons.SetActiveView(vbManager);

            }

            else if (NavigationMenu.SelectedValue == "File")
            {
                mvButtons.SetActiveView(vbFile);
            }
            else if (NavigationMenu.SelectedValue == "Help")
            {
                mvButtons.SetActiveView(vbHelp);
            }
        }

        protected void mvButtons_ActiveViewChanged(object sender, EventArgs e)
        {

        }

        protected void imgbSchedule_Click(object sender, ImageClickEventArgs e)
        {
            mvMain.SetActiveView(vDesignWorkReport);
            divDesignWorkReport.Visible = true;
            //divDesignBid.Visible = false;
        }

        protected void imgbNewBid_Click(object sender, ImageClickEventArgs e)
        {
            editing = false;
            mvMain.SetActiveView(vDesignBid);
            divDesignWorkReport.Visible = false;
            //divDesignBid.Visible = true;
        }

        
        protected void imgbNewManager_Click(object sender, ImageClickEventArgs e)
        {
            mvMain.SetActiveView(vNewClient);
         
            hectorsstuff.Visible = true;
        }

        protected void imgbLogout_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Landing/index.html");
        }

        protected void btnSearchSubmit_Click(object sender, EventArgs e)
        {
            
        }

        protected void imgbEditBid_Click(object sender, ImageClickEventArgs e)
        {
            editing = true;
            mvMain.SetActiveView(vClientSearch);
            
           
        }

        protected void imgbNewPP_Click(object sender, ImageClickEventArgs e)
        {
            mvMain.SetActiveView(vProduction);
        }

       

        private void ImgSwap(object sender)
        {
            Image img = (Image)sender;

            if (img.ImageUrl == "~/Landing/icons/round60.png")
            {

                img.ImageUrl = "~/Landing/icons/round62.png";
            }
            else
            {
                img.ImageUrl = "~/Landing/icons/round60.png";
            }
        }

        protected void imgbtnDBClientInfo_Click(object sender, ImageClickEventArgs e)
        {
            pnlDesignerClientInfo.Visible = !pnlDesignerClientInfo.Visible;

            ImgSwap(sender);
        }

        protected void imgbtnDBStaff_Click(object sender, ImageClickEventArgs e)
        {
            pnlDesignerStaff.Visible = !pnlDesignerStaff.Visible;

            ImgSwap(sender);
        }

        protected void collapProjectBid_Click(object sender, ImageClickEventArgs e)
        {
            pnlProductionBid.Visible = !pnlProductionBid.Visible;

            ImgSwap(sender);
        }

        protected void collapMaterial_Click(object sender, ImageClickEventArgs e)
        {
            pnlDesignerMatReq.Visible = !pnlDesignerMatReq.Visible;
            pnlProductionMatReq.Visible = !pnlProductionMatReq.Visible;

            ImgSwap(sender);
        }

        protected void collapLabour_Click(object sender, ImageClickEventArgs e)
        {
            pnlDesignerLabourReq.Visible = !pnlDesignerLabourReq.Visible;
            pnlProductionLabourReq.Visible = !pnlProductionLabourReq.Visible;

            ImgSwap(sender);
        }

        protected void collapProjectTeam_Click(object sender, ImageClickEventArgs e)
        {
            pnlProductionTeam.Visible = !pnlProductionTeam.Visible;

            ImgSwap(sender);
        }


        //DATABASE STUFF//////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////

        protected void gvClientData_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gRow = gvClientData.SelectedRow;
            //gRow.Cells[1].Text;

            //DesignBidDataSet ds = new DesignBidDataSet();
            ProjectDataTableAdapter daProj = new ProjectDataTableAdapter();
            daProj.Fill(ds.ProjectData);

            foreach (DataRow row in ds.ProjectData)
            {
                if (gRow.Cells[1].Text == row["cliName"].ToString())
                {
                    ddlProjectList.Items.Add(row["projName"].ToString());
                }
            }
        }

        protected void ddlProjectList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //database stuff
            //DesignBidDataSet ds = new DesignBidDataSet();
            DesignBidTableAdapter da = new DesignBidTableAdapter();

            try
            {
                //populate design bid

                //populate text boxes
                da.Fill(ds.DesignBid);

                foreach (DataRow row in ds.DesignBid)
                {
                    if (ddlProjectList.SelectedValue == row["projName"].ToString())
                    {
                        txtDBClientName.Text = row["cliName"].ToString();
                        txtDBClientPhone.Text = row["cliPhone"].ToString();
                        txtDBClientContact.Text = row["cliConFName"].ToString();
                        txtDBClientAddress.Text = row["cliAddress"].ToString();
                        txtDBBidDate.Text = row["projBidDate"].ToString();
                        txtDBBeginDate.Text = row["projEstStart"].ToString();
                        txtDBEndDate.Text = row["projEstEnd"].ToString();
                        txtDBProjectSite.Text = row["projSite"].ToString();
                        txtDBBidAmount.Text = row["projEstCost"].ToString();
                    }
                }

                //populate gridviews

                BindGrid((Object)gvPlant,ddlProjectList.SelectedValue, "Plant");
                //databind
                gvPlant.DataBind();

                BindGrid((Object)gvPottery, ddlProjectList.SelectedValue, "Pottery");
                //databind
                gvPottery.DataBind();

                BindGrid((Object)gvMaterial, ddlProjectList.SelectedValue, "Materials");
                //databind
                gvMaterial.DataBind();
            
                BindGrid((Object)gvLabor, ddlProjectList.SelectedValue, "Labor");
                //databind
                gvLabor.DataBind();
            }
            catch
            {

            }
            //end database stuff
            mvMain.SetActiveView(vDesignBid);
            
            //divDesignBid.Visible = true;
        }

        //DON'T MESS THIS UP
        protected void BindGrid(Object sender, string param1, string param2)
        {
            //get the reference to the gv sender
            GridView sent = (GridView)sender;
            
            //store param as tooltip to avoid using multiple variables, plus we needed tooltips
            sent.ToolTip = param2;

            //dataset for labor gridview only needs one param - sent "labor" as param and handled below
            if(param2 == "Labor")
            {
                LaborReqTableAdapter daLabor = new LaborReqTableAdapter();
                daLabor.Fill(ds.LaborReq, ddlProjectList.SelectedValue);
                sent.DataSource = ds.LaborReq;
            }
            //normal two param case
            else
            {
                MatReqPlantTableAdapter daPlant = new MatReqPlantTableAdapter();
                daPlant.Fill(ds.MatReqPlant, param1, param2);
                sent.DataSource = ds.MatReqPlant;
                Session[sent.ToolTip] = ds.MatReqPlant;
            }
        }

        protected void gv_RowEdit(object sender, GridViewEditEventArgs e)
        {
            GridView sent = (GridView)sender;
            sent.EditIndex = e.NewEditIndex;
            BindGrid(sender, ddlProjectList.SelectedValue, sent.ToolTip);
            //databind
            sent.DataBind();
        }

        protected void gv_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView sent = (GridView)sender;
            sent.EditIndex = -1;
            BindGrid(sender, ddlProjectList.SelectedValue, sent.ToolTip);
            //databind
            sent.DataBind();
        }

        protected void gv_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //get the reference to the gv sender
            GridView sent = (GridView)sender;
    
            BindGrid(sender, ddlProjectList.SelectedValue, sent.ToolTip);

            GridViewRow row = sent.Rows[e.RowIndex];

            short matreqestqty = Convert.ToInt16(((TextBox)(row.Cells[2].Controls[0])).Text);
            string matdesc = ((DropDownList)(row.Cells[3].Controls[0])).SelectedItem.Text;
            decimal invavgnet = Convert.ToDecimal(((TextBox)(row.Cells[4].Controls[0])).Text);
            short invsizeamnt = Convert.ToInt16(((TextBox)(row.Cells[6].Controls[0])).Text);
            string invsizeunit = ((DropDownList)(row.Cells[7].Controls[0])).SelectedItem.Text;
            int matreqid = Convert.ToInt32(((TextBox)(row.Cells[9].Controls[0])).Text);
            int invid = Convert.ToInt32(((TextBox)(row.Cells[10].Controls[0])).Text);
            int matid = Convert.ToInt32(((DropDownList)(row.Cells[3].Controls[0])).SelectedValue);
            //Convert.ToInt32(((TextBox)(row.Cells[11].Controls[0])).Text);
            string mattype = sent.ToolTip;
            

            ds.Tables["MatReqPlant"].Rows[row.DataItemIndex]["Qty"] = ((TextBox)(row.Cells[2].Controls[0])).Text;
            ds.Tables["MatReqPlant"].Rows[row.DataItemIndex]["Desc"] = ((DropDownList)(row.Cells[3].Controls[0])).SelectedItem.Text;
            ds.Tables["MatReqPlant"].Rows[row.DataItemIndex]["Unit Price"] = ((TextBox)(row.Cells[4].Controls[0])).Text;
            ds.Tables["MatReqPlant"].Rows[row.DataItemIndex]["Size"] = ((TextBox)(row.Cells[6].Controls[0])).Text;
            ds.Tables["MatReqPlant"].Rows[row.DataItemIndex]["Size (dim)"] = ((DropDownList)(row.Cells[7].Controls[0])).SelectedItem.Text;

            //stop editing
            sent.EditIndex = -1;

            //create table adapters for tables to be updated
            MATERIALTableAdapter daMat = new MATERIALTableAdapter();
            MATERIAL_REQTableAdapter daMatReq = new MATERIAL_REQTableAdapter();
            INVENTORYTableAdapter daInv = new INVENTORYTableAdapter();

            //UPDATE
            daMat.Update(matdesc, mattype, matid);
            daMatReq.Update(matreqestqty, matreqid);
            daInv.Update(invavgnet, invsizeamnt, invsizeunit, matid, invid);
            sent.DataBind();
        }

        protected void imgbtnPBAddRow_Click(object sender, ImageClickEventArgs e)
        {
            
        }

        protected void gv_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            
        }

        protected void gv_RowCreated(object sender, GridViewRowEventArgs e)
        {
            //check that row being modified is not the header
            if (e.Row.RowType != DataControlRowType.Header)
            {
                //MATERIAL DESCRIPTION
                //get the reference to the gv sender
                GridView sent = (GridView)sender;
                //define drop down list and properties to be inserted into edit
                DropDownList ddlMatDesc = new DropDownList();

                ddlMatDesc.DataSourceID = "eds"+sent.ToolTip;
                ddlMatDesc.DataTextField = "matDesc";
                ddlMatDesc.DataValueField = "ID";
                //inject drop down list into gridview
                e.Row.Cells[3].Controls.Add(ddlMatDesc);
                //remove default text box control
                e.Row.Cells[3].Controls.RemoveAt(0);

                //UNIT SIZE
                //define drop down list and properties to be inserted into edit
                DropDownList ddlSizeUnit = new DropDownList();

                ddlSizeUnit.DataSourceID = edsSizeUnit.ID;
                ddlSizeUnit.DataTextField = "invSizeUnit";
                //inject drop down list into gridview
                e.Row.Cells[7].Controls.Add(ddlSizeUnit);
                //remove default text box control
                e.Row.Cells[7].Controls.RemoveAt(0);
            }

            //hide primary key columns
            e.Row.Cells[8].Visible = false;
            e.Row.Cells[9].Visible = false;
            e.Row.Cells[10].Visible = false;
            e.Row.Cells[11].Visible = false;
        }

        protected void gv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //get the reference to the gv sender
            GridView sent = (GridView)sender;
            GridViewRow row = sent.Rows[e.RowIndex];


            int matreqid = Convert.ToInt32(row.Cells[9].Text);
            MATERIAL_REQTableAdapter daMatReq = new MATERIAL_REQTableAdapter();
            daMatReq.Delete(matreqid);


            BindGrid(sender, ddlProjectList.SelectedValue, sent.ToolTip);
            sent.DataBind();
        }

        protected void imgbDesignSubmit_Click(object sender, ImageClickEventArgs e)
        {
            //get the reference to the gv sender
            GridView sent = (GridView)sender;
            
            string cliname = txtDBClientName.Text;
            string cliaddress = txtDBClientAddress.Text;
            string cliprovince = ddlDBClientProvince.SelectedValue;
            string clipcode = txtDBClientPCode.Text;
            string cliphone = txtDBClientPhone.Text;
            string confname;
            string conlname;
            string cliconposition;
            string city = txtDBClientCity.Text;
            string projname = txtDBProjName.Text;
            string projsite = txtDBProjectSite.Text;
            string projbiddate = txtDBBidDate.Text;
            string projeststart = txtDBBeginDate.Text;
            string projestend = txtDBEndDate.Text;
            decimal projestcost = Convert.ToDecimal(txtDBBidAmount.Text);

            //create table adapters for tables to be updated
            CLIENTTableAdapter daClient = new CLIENTTableAdapter();
      
            //UPDATE
            daClient.Insert(cliname, cliaddress, cliprovince, clipcode, cliphone, "", "", "", null);
        }

        
        protected void imgbtnDBAddRow_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["Plant"] != null)
            {
                tempGrid = (DataTable)Session["Plant"];
            }
            //MATREQLASTIDTableAdapter damatreqlastid = new MATREQLASTIDTableAdapter();
            //damatreqlastid.Fill(ds.MATREQLASTID);

            //int tempMatReqLastID = Convert.ToInt32(ds.MATREQLASTID.Rows[0].ItemArray[0]);
            tempGrid.Rows.Add(0, "", 0, 0, 0, "", 0, 0, 0, 0);
            gvPlant.DataSource = tempGrid;
            gvPlant.DataBind();
            Session["Plant"] = tempGrid;
        }

        protected void imgbNewPAR_Click(object sender, ImageClickEventArgs e)
        {
            mvMain.SetActiveView(vCreatePAR);
        }

        protected void imgbClients_Click(object sender, ImageClickEventArgs e)
        {
            mvMain.SetActiveView(vNewClient);
           
        }

    }
}