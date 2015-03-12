<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Template.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Natural Tracker- Natural by Design</title>
    <script src="scripts/jquery-2.1.1.min.js" type="text/javascript"></script>
   
    <link href="main.css" rel="stylesheet" />
 
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css"/>

    <link href='http://fonts.googleapis.com/css?family=Ubuntu' rel='stylesheet' type='text/css' />
  <link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css' />

     <script src="scripts/script.js" type="text/javascript"> </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="TopBar">
    
        <asp:Label ID="lbltitle" runat="server" Font-Size="XX-Large" Text="Natural Tracker" Font-Bold="True" CssClass="title"></asp:Label>
        <asp:Label ID="lblcompanyName" runat="server" Font-Italic="True" Font-Size="X-Large" Text="Natural by Design" CssClass="nbd"></asp:Label>
    </div>

  
  <div class="wrapper">
       
        <asp:Menu ID="NavigationMenu" CssClass="navMenu" runat="server" Orientation="Horizontal" StaticSubMenuIndent="10px" OnMenuItemClick="NavigationMenu_MenuItemClick" BackColor="#FFFBD6" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#990000">


              <LevelMenuItemStyles>
                <asp:MenuItemStyle CssClass="navMenuitems"/>

            </LevelMenuItemStyles>
            
            
            <DynamicHoverStyle BackColor="#990000" ForeColor="White" />
            <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <DynamicMenuStyle BackColor="#FFFBD6" />
            <DynamicSelectedStyle BackColor="#FFFFCA" BorderStyle="Double" />
            
            
            <Items>
                <asp:MenuItem Text="File" Value="File"></asp:MenuItem>

                <asp:MenuItem Text="Designer" Value="Design"></asp:MenuItem>
                <asp:MenuItem Text="Worker" Value="Worker"></asp:MenuItem>
                <asp:MenuItem Text="Production" Value="Production"></asp:MenuItem>
                <asp:MenuItem Text="Manager" Value="Manager"></asp:MenuItem>
                <asp:MenuItem Text="Help" Value="Help"></asp:MenuItem>
            </Items>
            <StaticHoverStyle BackColor="#8D9D46" ForeColor="White" />
            <StaticMenuItemStyle BackColor="#F6FCDC" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Font-Names="Arial Black" Font-Size="Large" ForeColor="Black" HorizontalPadding="15px" VerticalPadding="5px" Font-Bold="True" />
              <StaticSelectedStyle BackColor="#DFEDA2" CssClass="menuitemSelected" />
            <StaticItemTemplate>
                <%# Eval("Text") %>
            </StaticItemTemplate>
        </asp:Menu>




        <asp:MultiView ID="mvButtons" runat="server" OnActiveViewChanged="mvButtons_ActiveViewChanged">
        

          

            <asp:View ID="vbDesigner" runat="server"  >

            <div class="buttonsContainer" >
            
               
                <div class="buttons">
            <asp:ImageButton ID="imgbNewBid" runat="server" ImageUrl="~/icons/document162.png" Width="35px"  ClientIDMode="Static" ToolTip="Create New Bid" OnClick="imgbNewBid_Click"  />
            <br/><asp:Label ID="Label1"  AssociatedControlID="imgbNewBid" runat="server" CssClass="buttonlabels" Text="New"></asp:Label>
            </div>
            
             <div class="buttons">
             <asp:ImageButton ID="imgbEditBid" runat="server" Width="35px" ImageUrl="~/icons/clasic.png" ClientIDMode="Static" ToolTip="Edit Bids" />
            <br/> <asp:Label ID="Label2" runat="server" Text="Edit" CssClass="buttonlabels"></asp:Label>
            </div>
                
                
            <div class="buttons">
            <asp:ImageButton ID="imgbSaveBid" runat="server" Width="35px" ImageUrl="~/icons/file96.png"  ClientIDMode="Static" ToolTip="Save current bid" />
            <br/> <asp:Label ID="Label3" runat="server" Text="Save" CssClass="buttonlabels"></asp:Label>
             </div>
           
                   <div class="buttons">
            <asp:ImageButton ID="imgbViewBids" runat="server" Width="35px" ImageUrl="~/icons/eye106.png"  ClientIDMode="Static" ToolTip="View Bids" />
            <br/> <asp:Label ID="Label5" runat="server" Text="View" CssClass="buttonlabels"></asp:Label>
             </div>
                <div class="buttons">
            <asp:ImageButton ID="imgbSchedule" runat="server" Width="35px" ImageUrl="~/icons/basic17.png"  ClientIDMode="Static" ToolTip="Daily Work Report" OnClick="imgbSchedule_Click" />
            <br/> <asp:Label ID="Label4" AssociatedControlID="imgbSchedule" runat="server" Text="DWR" CssClass="buttonlabels"></asp:Label>
             </div>
    
           
        </div>

        </asp:View>
        
             <asp:View ID="vbProduction" runat="server"  >


                   <div class="buttonsContainer">


                        <div class="buttons">
            <asp:ImageButton ID="imgbNewPP" runat="server" ImageUrl="~/icons/document162.png" Width="35px"  ClientIDMode="Static" ToolTip="Create New Production Plan" OnClick="imgbNewPP_Click"  />
            <br/><asp:Label ID="Label9" AssociatedControlID="imgbNewPP" runat="server" CssClass="buttonlabels" Text="New"></asp:Label>
            </div>
            
             <div class="buttons">
             <asp:ImageButton ID="imgbEditPP" runat="server" Width="35px" ImageUrl="~/icons/clasic.png" ClientIDMode="Static" ToolTip="Edit Production Plan" />
            <br/> <asp:Label ID="Label10" runat="server" Text="Edit" CssClass="buttonlabels"></asp:Label>
            </div>
             
                  
                
            <div class="buttons">
            <asp:ImageButton ID="imgbSavePP" runat="server" Width="35px" ImageUrl="~/icons/file96.png"  ClientIDMode="Static" ToolTip="Save current Production Plan" />
            <br/> <asp:Label ID="Label11" runat="server" Text="Save" CssClass="buttonlabels"></asp:Label>
             </div>
                           
            <div class="buttons">
            <asp:ImageButton ID="ImageButton9" runat="server" Width="35px" ImageUrl="~/icons/eye106.png"  ClientIDMode="Static" ToolTip="Save current Production Plan" />
            <br/> <asp:Label ID="Label18" runat="server" Text="View" CssClass="buttonlabels"></asp:Label>
             </div>
                       <div class="buttons">
            <asp:ImageButton ID="imgbNewPAR" runat="server" Width="35px" ImageUrl="~/icons/right247.png"  ClientIDMode="Static" ToolTip="New Production Administration Report" OnClick="imgbNewPAR_Click" />
            <br/> <asp:Label ID="Label53" AssociatedControlID="imgbNewPAR"  runat="server" Text="PAR" CssClass="buttonlabels"></asp:Label>
             </div>
                       </div>


        </asp:View>



            <asp:View ID="vbManager" runat="server"  >


                   <div class="buttonsContainer">

                       <div class="buttons">
                           <asp:ImageButton ID="imgbNewManager" runat="server" ClientIDMode="Static" ImageUrl="~/icons/document162.png" ToolTip="Create New Production Plan" Width="35px" OnClick="imgbNewManager_Click" />
                           <br/>
                           <asp:Label ID="Label29" runat="server" AssociatedControlID="imgbNewManager"  CssClass="buttonlabels" Text="New"></asp:Label>
                       </div>
                       <div class="buttons">
                           <asp:ImageButton ID="imgbEditManager" runat="server" ClientIDMode="Static" ImageUrl="~/icons/clasic.png" ToolTip="Edit Production Plan" Width="35px" />
                           <br/>
                           <asp:Label ID="Label30" runat="server" CssClass="buttonlabels" Text="Edit"></asp:Label>
                       </div>
                       <div class="buttons">
                           <asp:ImageButton ID="imgbSaveManager" runat="server" ClientIDMode="Static" ImageUrl="~/icons/file96.png" ToolTip="Save current Production Plan" Width="35px" />
                           <br/>
                           <asp:Label ID="Label31" runat="server" CssClass="buttonlabels" Text="Save"></asp:Label>
                       </div>

            <div class="buttons">
            <asp:ImageButton ID="imgbViewManager" runat="server" Width="35px" ImageUrl="~/icons/eye106.png"  ClientIDMode="Static" ToolTip="View Bids" />
            <br/> <asp:Label ID="Label28" runat="server" Text="View(5)" CssClass="buttonlabels"></asp:Label>
             </div>
                

                    <div class="buttons">
            <asp:ImageButton ID="imgbClients" runat="server" Width="35px" ImageUrl="~/icons/address19.png"  ClientIDMode="Static" ToolTip="Manage Clients" OnClick="imgbClients_Click" />
            <br/> <asp:Label ID="Label32" AssociatedControlID="imgbClients" runat="server" Text="Clients" CssClass="buttonlabels"></asp:Label>
             </div>
                    

                       <div class="buttons">
            <asp:ImageButton ID="imgbRules" runat="server" Width="35px" ImageUrl="~/icons/ship11.png"  ClientIDMode="Static" ToolTip="Business Rules" />
            <br/> <asp:Label ID="Label33" runat="server" Text="Rules" CssClass="buttonlabels"></asp:Label>
             </div>
                       
                       <div class="buttons">
            <asp:ImageButton ID="imgbViewPARs" runat="server" Width="35px" ImageUrl="~/icons/right247.png"  ClientIDMode="Static" ToolTip="View Production Administration Reports" OnClick="imgbViewPARs_Click" />
            <br/> <asp:Label ID="Label54" AssociatedControlID="imgbViewPARs" runat="server" Text="PARs" CssClass="buttonlabels"></asp:Label>
             </div>
          

                       </div>


                 </asp:View>
        
         <asp:View ID="vbFile" runat="server"  >
        
             <div class="buttonsContainer">

                  <div class="buttons">
            <asp:ImageButton ID="imbPrint" runat="server" Width="35px" ImageUrl="~/icons/print45.png"  ClientIDMode="Static" />
            <br/> <asp:Label ID="Label6" runat="server" Text="Print" CssClass="buttonlabels"></asp:Label>
             </div>
                 <div class="buttons">
            <asp:ImageButton ID="imgbEmail" runat="server" Width="35px" ImageUrl="~/icons/mail80.png"  ClientIDMode="Static"  />
            <br/> <asp:Label ID="Label7" runat="server" Text="Email" CssClass="buttonlabels"></asp:Label>
             </div>

                 <div class="buttons">
            <asp:ImageButton ID="imgbOptions" runat="server" Width="35px" ImageUrl="~/icons/wrench73.png"  ClientIDMode="Static"  />
            <br/> <asp:Label ID="Label8" runat="server" Text="Options" CssClass="buttonlabels"></asp:Label>
             </div>
                 
                  <div class="buttons">
            <asp:ImageButton ID="imgbLogout" runat="server" Width="35px" ImageUrl="~/icons/logout13.png"  ClientIDMode="Static" OnClick="imgbLogout_Click"  />
            <br/> <asp:Label ID="Label17" runat="server" Text="Logout" CssClass="buttonlabels" AssociatedControlID="imgbLogout"></asp:Label>
             </div>
        


            </div>



        </asp:View>
        
           <asp:View ID="vbHelp" runat="server"  >
           

                <div class="buttonsContainer">

                  <div class="buttons">
            <asp:ImageButton ID="imgbTutorials" runat="server" Width="35px" ImageUrl="~/icons/info22.png"  ClientIDMode="Static" />
            <br/> <asp:Label ID="Label14" runat="server" Text="Tutorial" CssClass="buttonlabels"></asp:Label>
             </div>
            
                    <div class="buttons">
            <asp:ImageButton ID="imgbSendReport" runat="server" Width="35px" ImageUrl="~/icons/left225.png"  ClientIDMode="Static" ToolTip="Send Support Ticket" />
            <br/> <asp:Label ID="Label16" runat="server" Text="Ticket" CssClass="buttonlabels"></asp:Label>
             </div>

                 <div class="buttons">
            <asp:ImageButton ID="imgbAbout" runat="server" Width="35px" ImageUrl="~/icons/puzzle38.png"  ClientIDMode="Static" ToolTip="About Natural Tracker"  />
            <br/> <asp:Label ID="Label15" runat="server" Text="About" CssClass="buttonlabels"></asp:Label>
             </div>

            </div>

           </asp:View>
       
        </asp:MultiView>
        <br />
        <asp:MultiView ID="mvMain" runat="server" OnActiveViewChanged="MultiView1_ActiveViewChanged" ActiveViewIndex="0">
        <asp:View ID="vBlank" runat="server">
            <!----*******                       BLANK View                             ******** ---->
        </asp:View>
        <asp:View ID="vDesignBid" runat="server"  >
                      <!----*******                       Designer View                             ******** ---->

            <asp:Label ID="Label48" runat="server" Text="Client Information" CssClass="titles" Font-Bold="True" Font-Size="Medium"></asp:Label><asp:ImageButton ID="imgbtnDBClientInfo" runat="server" ImageUrl="~/Landing/icons/round60.png" OnClick="imgbtnDBClientInfo_Click" Width="25px" />
            <asp:Panel ID="pnlDesignerClientInfo" runat="server" CssClass="panels" BorderStyle="Solid" BorderWidth="1px">

                <br/>Name:
                <asp:TextBox ID="txtDBClientName" runat="server"></asp:TextBox>
                &nbsp;&nbsp; &nbsp; Contact:
                <asp:TextBox ID="txtDBClientContact" runat="server"></asp:TextBox>
                &nbsp;<br />
                        <br />
                Address:
                <asp:TextBox ID="txtDBClientAddress" runat="server"></asp:TextBox>
                &nbsp;&nbsp; &nbsp; Phone:
                <asp:TextBox ID="txtDBClientPhone" runat="server"></asp:TextBox>
                &nbsp;<br />
                <br />
                City:
                <asp:TextBox ID="txtDBClientCity" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Province:
                <asp:DropDownList ID="ddlDBClientProvince" runat="server">
                    <asp:ListItem>Ontario</asp:ListItem>
                    <asp:ListItem>Quebec</asp:ListItem>
                    <asp:ListItem>Manitoba</asp:ListItem>
                    <asp:ListItem>Alberta</asp:ListItem>
                    <asp:ListItem>Saskatchawan</asp:ListItem>
                    <asp:ListItem>British Columbia</asp:ListItem>
                    <asp:ListItem>Yukon</asp:ListItem>
                    <asp:ListItem>Nova Scotia</asp:ListItem>
                    <asp:ListItem>New Brunswick</asp:ListItem>
                    <asp:ListItem>Prince Edward Island</asp:ListItem>
                    <asp:ListItem>Nunavut</asp:ListItem>
                    <asp:ListItem>North West Territories</asp:ListItem>
                    <asp:ListItem Selected="True" Value="0">Select Province</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                Postal Code:
                <asp:TextBox ID="txtDBClientPCode" runat="server"></asp:TextBox>
                      </asp:Panel>
             <asp:Label ID="label49" runat="server" Text="NBD Staff" CssClass="titles" Font-Bold="True" Font-Size="Medium"></asp:Label><asp:ImageButton ID="imgbtnDBStaff" runat="server" ImageUrl="~/Landing/icons/round60.png" OnClick="imgbtnDBStaff_Click" Width="25px" />
                 <asp:Panel ID="pnlDesignerStaff" runat="server" CssClass="panels" BorderStyle="Solid" BorderWidth="1px">
                     <br/>Sales Associate:
                     <asp:TextBox ID="txtDBSalesAssociate" runat="server"></asp:TextBox>
                     &nbsp;<br/>
                        
                        <br/>
                     Phone:
                     <asp:TextBox ID="txtDBSalesAssociatePhone" runat="server"></asp:TextBox>
                     &nbsp;<br />
                        <br />
                     Designer:
                     <asp:TextBox ID="txtDBDesignerName" runat="server"></asp:TextBox>
                     &nbsp;&nbsp; &nbsp; Phone:
                     <asp:TextBox ID="txtDBDesignerPhone" runat="server"></asp:TextBox>
                     &nbsp;</asp:Panel>

            <asp:Label ID="label50" runat="server" Text="Project Information" CssClass="titles" Font-Bold="True" Font-Size="Medium"></asp:Label><asp:ImageButton ID="imgbtnDBProjectInfo" runat="server" ImageUrl="~/Landing/icons/round60.png" OnClick="collapProjectBid_Click" Width="25px" />
                 <asp:Panel ID="pnDesignerProject" runat="server" CssClass="panels" BorderStyle="Solid" BorderWidth="1px">

                     <br />
                     Project Name:
                     <asp:TextBox ID="txtDBProjName" runat="server"></asp:TextBox>
                     <br />
                     <br/>
                     Bid Date:
                     <asp:TextBox ID="txtDBBidDate" runat="server"></asp:TextBox>
                     &nbsp;&nbsp; &nbsp; Project Site:
                     <asp:TextBox ID="txtDBProjectSite" runat="server"></asp:TextBox>
                     &nbsp;<br />
                        <br />
                     Begin Date:
                     <asp:TextBox ID="txtDBBeginDate" runat="server"></asp:TextBox>
                     &nbsp;<br />
                        <br />
                     End Date:
                     <asp:TextBox ID="txtDBEndDate" runat="server"></asp:TextBox>
                     &nbsp;&nbsp; &nbsp; Bid Amount:
                     <asp:TextBox ID="txtDBBidAmount" runat="server"></asp:TextBox>
                     &nbsp;</asp:Panel>
            
             <asp:Label ID="label51" runat="server" Text="Material Requirements" CssClass="titles" Font-Bold="True" Font-Size="Medium"></asp:Label><asp:ImageButton ID="imgbtnDBMatReq" runat="server" ImageUrl="~/Landing/icons/round60.png" OnClick="collapMaterial_Click" Width="25px" />
                 <asp:Panel ID="pnlDesignerMatReq" runat="server" CssClass="panels" BorderStyle="Solid" BorderWidth="1px">

                     <asp:EntityDataSource ID="edsPlant" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=NBD_SBEntities" DefaultContainerName="NBD_SBEntities" EnableFlattening="False" EntitySetName="MATERIALs" EntityTypeFilter="MATERIAL" Select="it.[matDesc], it.[ID], it.[matType]" Where="">
                         <WhereParameters>
                             <asp:Parameter DefaultValue="Plant" Name="matType" />
                         </WhereParameters>
                     </asp:EntityDataSource>
                     <asp:EntityDataSource ID="edsPottery" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=NBD_SBEntities" DefaultContainerName="NBD_SBEntities" EnableFlattening="False" EntitySetName="MATERIALs" EntityTypeFilter="MATERIAL" Select="it.[matDesc], it.[ID], it.[matType]" Where="">
                         <WhereParameters>
                             <asp:Parameter DefaultValue="Pottery" Name="matType" />
                         </WhereParameters>
                     </asp:EntityDataSource>
                     <asp:EntityDataSource ID="edsMaterials" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=NBD_SBEntities" DefaultContainerName="NBD_SBEntities" EnableFlattening="False" EntitySetName="MATERIALs" EntityTypeFilter="MATERIAL" Select="it.[matDesc], it.[ID], it.[matType]" Where="">
                         <WhereParameters>
                             <asp:Parameter DefaultValue="Materials" Name="matType" />
                         </WhereParameters>
                     </asp:EntityDataSource>
                     <asp:EntityDataSource ID="edsSizeUnit" runat="server" ConnectionString="name=NBD_SBEntities" DefaultContainerName="NBD_SBEntities" EnableFlattening="False" EntitySetName="INVENTORies" EntityTypeFilter="INVENTORY" GroupBy="it.[invSizeUnit]" Select="it.[invSizeUnit]">
                     </asp:EntityDataSource>
                     <br />

                     <br/>Plants:
                     <asp:ImageButton ID="imgbtnDBAddRow" runat="server" ImageUrl="~/Landing/icons/add189.png" OnClick="imgbtnDBAddRow_Click" Width="25px" />
                     &nbsp;<asp:GridView ID="gvPlant" runat="server" AllowSorting="True" OnRowCreated="gv_RowCreated" OnRowEditing="gv_RowEdit" OnRowUpdating="gv_RowUpdating" OnRowCancelingEdit="gv_RowCancelingEdit" OnRowUpdated="gv_RowUpdated" OnRowDeleting="gv_RowDeleting">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ShowDeleteButton="True" />
                            </Columns>
                     </asp:GridView>
                        <br />
                        <br />
                        Pottery:
                        <asp:GridView ID="gvPottery" runat="server" OnRowCreated="gv_RowCreated" OnRowEditing="gv_RowEdit" OnRowUpdating="gv_RowUpdating" OnRowCancelingEdit="gv_RowCancelingEdit">
                            <Columns>
                                <asp:CommandField ShowEditButton="True" />
                                <asp:CommandField ShowDeleteButton="True" />
                            </Columns>
                        </asp:GridView>
                        <br />
                        Materials:
                        <asp:GridView ID="gvMaterial" runat="server" OnRowCreated="gv_RowCreated" OnRowEditing="gv_RowEdit" OnRowUpdating="gv_RowUpdating" OnRowCancelingEdit="gv_RowCancelingEdit">
                            <Columns>
                                <asp:CommandField ShowEditButton="True" />
                                <asp:CommandField ShowDeleteButton="True" />
                            </Columns>
                     </asp:GridView>

                    </asp:Panel>
            <asp:Label ID="label52" runat="server" Text="Labour Requirements" CssClass="titles" Font-Bold="True" Font-Size="Medium"></asp:Label><asp:ImageButton ID="imgbtnDBLabourReq" runat="server" ImageUrl="~/Landing/icons/round60.png" OnClick="collapLabour_Click" Width="25px" />
                 <asp:Panel ID="pnlDesignerLabourReq" runat="server" CssClass="panels" BorderStyle="Solid" BorderWidth="1px">
             <br />
                   
                     <asp:GridView ID="gvLabor" runat="server" OnRowEditing="gv_RowEdit" OnRowUpdating="gv_RowUpdating" OnRowCancelingEdit="gv_RowCancelingEdit">
                         <Columns>
                             <asp:CommandField ShowEditButton="True" />
                         </Columns>
                     </asp:GridView>
                    <br />
                     &nbsp;&nbsp; &nbsp;&nbsp;
             </asp:Panel>

                            
                 <asp:ImageButton ID="imgbDesignSubmit" runat="server" ImageUrl="~/Landing/icons/up177.png" ToolTip="Submit" Width="40px" OnClick="imgbDesignSubmit_Click" />
                <asp:ImageButton ID="imgbDesignerCancel" runat="server" ImageUrl="~/Landing/icons/return10.png" ToolTip="Cancel" Width="40px" />
                	
       
        </asp:View>
        <asp:View ID="vDesignWorkReport" runat="server"  >
            <div id ="divDesignWorkReport" runat="server" visible="false">
                <asp:Label ID="Label" runat="server" Text="ENTER  YOUR DAILY WORK REPORT"></asp:Label>
                <br />
                <br />
                <br />
            <br />
            <asp:Label ID="Label42" runat="server" Text="Design Work Report"></asp:Label>
            :
            <asp:Button ID="btnPlus1" runat="server" Text="Plus1" />
            <br />
            <br />
            <asp:Label ID="Label43" runat="server" Text="Project:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label44" runat="server" Text="Stage:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label45" runat="server" Text="Hours:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label46" runat="server" Text="Task:"></asp:Label>
            <br />
            <asp:DropDownList ID="ddlProject" runat="server" DataSourceID="EntityDataSource1"  DataValueField="ID">
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlStage" runat="server">
                <asp:ListItem>P</asp:ListItem>
                <asp:ListItem>B</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox7" runat="server" Width="44px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="EntityDataSource2" DataValueField="ID">
            </asp:DropDownList>
            <br />
            <br />
            <asp:GridView ID="gvDesignReport" runat="server">
            </asp:GridView>
            <br />
            <br />
            <asp:Label ID="Label47" runat="server" Text="Save:"></asp:Label>
            <br />
            <asp:EntityDataSource ID="EntityDataSource3" runat="server" ConnectionString="name=NBD_SBEntities" DefaultContainerName="NBD_SBEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="PROJECTs">
            </asp:EntityDataSource>
            <asp:EntityDataSource ID="EntityDataSource4" runat="server" ConnectionString="name=NBD_SBEntities" DefaultContainerName="NBD_SBEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="TASKs" EntityTypeFilter="TASK">
            </asp:EntityDataSource>
            <asp:EntityDataSource ID="EntityDataSource5" runat="server">
            </asp:EntityDataSource>
            <br />
           </div>
    </asp:View>
        
        <asp:View ID="vWorkReport" runat="server"  >
        <div id ="divWorkReport">

        <asp:Label ID="Label34" runat="server" Text="ENTER DAILY WORK REPORT"></asp:Label>
        <br />
        <br />
        <br />
        <asp:Label ID="Label35" runat="server" Text="Materials Used:"></asp:Label>
&nbsp;<asp:Button ID="plus1" runat="server" Text="plus1" />
        <br />
        <br />
        <asp:Label ID="Label36" runat="server" Text="Materials:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label37" runat="server" Text="Quantity:"></asp:Label>
        <br />
        <asp:DropDownList ID="ddlMaterials" runat="server" DataSourceID="EntityDataSource2" DataTextField="matDesc" DataValueField="ID">
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtQuantity" runat="server" Width="61px"></asp:TextBox>
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="EntityDataSource2">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="matDesc" HeaderText="matDesc" SortExpression="matDesc" />
                <asp:BoundField DataField="matType" HeaderText="matType" SortExpression="matType" />
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <br />
        <asp:Label ID="Label38" runat="server" Text="Labour:"></asp:Label>
&nbsp;<asp:Button ID="plus2" runat="server" Text="plus2" />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <asp:Label ID="Label39" runat="server" Text="Task:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label40" runat="server" Text="Hours:"></asp:Label>
        <br />
        <asp:DropDownList ID="ddlTask" runat="server" DataSourceID="EntityDataSource1" DataTextField="taskDesc" DataValueField="ID">
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtHours" runat="server" Width="72px"></asp:TextBox>
        <br />
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="EntityDataSource1">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="taskDesc" HeaderText="taskDesc" SortExpression="taskDesc" />
                <asp:BoundField DataField="taskStdTimeAmnt" HeaderText="taskStdTimeAmnt" SortExpression="taskStdTimeAmnt" />
                <asp:BoundField DataField="taskStdTimeUnit" HeaderText="taskStdTimeUnit" SortExpression="taskStdTimeUnit" />
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <asp:Label ID="Label41" runat="server" Text="Save:"></asp:Label>
        <br />
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=NBD_SBEntities" DefaultContainerName="NBD_SBEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="TASKs" EntityTypeFilter="TASK">
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="EntityDataSource2" runat="server" ConnectionString="name=NBD_SBEntities" DefaultContainerName="NBD_SBEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="MATERIALs" EntityTypeFilter="MATERIAL">
        </asp:EntityDataSource>
        <br />
    
    </div>
    </asp:View>
            

            


             <asp:View ID="vProduction" runat="server"  >
                        <!----*******                       New Prod Plan View                             ******** ---->
                 <label>
                 Project Bid</label>
                 <asp:ImageButton ID="imgbtnPBProjectInfo" runat="server" ImageUrl="~/Landing/icons/round60.png" OnClick="collapProjectBid_Click" Width="25px" />
                 <asp:Panel ID="pnlProductionBid" runat="server" BorderStyle="Solid" BorderWidth="1px" CssClass="panels">
                     
                     <br/>
                     Name:
                     <input type="text" name="Name" />
                     Project Site:
                     <input type="text" name="site" />
                     <br />
                     <br />
                     Begin Date:
                     <input type="text" name="beginDate" />
                     <br />
                     <br />
                     End Date:
                     <input type="text" name="endDate" />
                     &nbsp; &nbsp; Bid Amount:
                     <input type="text" name="bidAmount" />
                 </asp:Panel>
                
                 <br/>
                 
                 <label>
                 Project Team</label>
                 <asp:ImageButton ID="imgbtnPBTeam" runat="server" ImageUrl="~/Landing/icons/round60.png" OnClick="collapProjectTeam_Click" Width="25px" />
                 <asp:Panel ID="pnlProductionTeam" runat="server" BorderStyle="Solid" BorderWidth="1px" CssClass="panels">
                     
                     <br/>
                     Sales Associate(s):
                     <input type="text" name="sale" />
                     &nbsp; &nbsp; Designer(s):
                     <input type="text" name="sale" />
                     &nbsp; &nbsp;
                     <br />
                     Production Worker(s):
                     <input type="text" name="sale" />
                 </asp:Panel>
                 <br/>
                
                 <label>
                 Material Requirements</label>
                 <asp:ImageButton ID="imgbtnPBMatReq" runat="server" ImageUrl="~/Landing/icons/round60.png" OnClick="collapMaterial_Click" Width="25px" />
                 <asp:Panel ID="pnlProductionMatReq" runat="server" BorderStyle="Solid" BorderWidth="1px" CssClass="panels">
                     
                     <asp:Label ID="lblProdTest" runat="server" Text="Label"></asp:Label>
                     
                     <br/>
                     Plants:<asp:ImageButton ID="imgbtnPBAddRow" runat="server" ImageUrl="~/Landing/icons/round77.png" OnClick="imgbtnPBAddRow_Click" Width="25px" />
                     <br />
                     <asp:GridView ID="gvPBPlant" runat="server" AllowSorting="True">
                         <Columns>
                             <asp:CommandField ShowEditButton="True" />
                         </Columns>
                     </asp:GridView>
                     <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"></asp:ObjectDataSource>
                     <br />
                     Pottery:
                     <asp:GridView ID="GridView5" runat="server">
                     </asp:GridView>
                     <br />
                     Materials:
                     <asp:GridView ID="GridView6" runat="server">
                     </asp:GridView>
                     Tools:
                     <asp:GridView ID="gvTools" runat="server">
                     </asp:GridView>
                 </asp:Panel>
                 <br/>
                
                 <label>
                 Labour Requirements:</label><asp:ImageButton ID="imgbtnPBLabourReq" runat="server" ImageUrl="~/Landing/icons/round60.png" OnClick="collapLabour_Click" Width="25px" />
                 <asp:Panel ID="pnlProductionLabourReq" runat="server" BorderStyle="Solid" BorderWidth="1px" CssClass="panels">
                     &nbsp;<asp:GridView ID="GridView7" runat="server" CssClass="grids">
                     </asp:GridView>
                     <br />
                 </asp:Panel>
                 <asp:ImageButton ID="imgbApprove" runat="server" ImageUrl="~/Landing/icons/done.png" ToolTip="Approve" Width="40px" />
                 &nbsp;<asp:ImageButton ID="imgbReject" runat="server" ImageUrl="~/Landing/icons/delete85.png" ToolTip="Reject" Width="40px" />
                 <asp:ImageButton ID="ImageButton17" runat="server" ImageUrl="~/Landing/icons/return10.png" ToolTip="Cancel" Width="40px" />
                 &nbsp; &nbsp;&nbsp;
                 <br/>
          <!----*******                       New Prod. Plan View                             ******** ---->
                 


       </asp:View>

            <asp:View ID="vClientSearch" runat="server"  >
         
                    <asp:Panel ID="pnlClientSearch" runat="server">
                        <asp:Label ID="lblClient" runat="server" Text="Client"></asp:Label>
                        &nbsp;<asp:DropDownList ID="ddlClientName" runat="server" AutoPostBack="True" DataSourceID="edsClientName" DataTextField="cliName" DataValueField="ID">
                        </asp:DropDownList>
                        <br />
                        <br />
                        <asp:Label ID="lblSearchClientName" runat="server" Text="Client Name"></asp:Label>
                        &nbsp;<asp:TextBox ID="txtSearchClientName" runat="server" AutoPostBack="True"></asp:TextBox>
                        <br />
                        <asp:Label ID="lblSearchClientPCode" runat="server" Text="PCode"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtSearchClientPCode" runat="server" AutoPostBack="True"></asp:TextBox>
                        <br />
                        <asp:Label ID="lblSearchClientPhone" runat="server" Text="Phone"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtSearchClientPhone" runat="server" AutoPostBack="True"></asp:TextBox>
                        <br />
                        <asp:Label ID="lblSearchClientConName" runat="server" Text="Con Name"></asp:Label>
                        &nbsp;&nbsp;
                        <asp:TextBox ID="txtSearchClientConName" runat="server" AutoPostBack="True"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Button ID="btnSearchSubmit" runat="server" Text="Submit" OnClick="btnSearchSubmit_Click" />
                        <br />
                        <br />
                        <asp:GridView ID="gvClientData" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="edsClientData" OnSelectedIndexChanged="gvClientData_SelectedIndexChanged">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="cliName" HeaderText="cliName" SortExpression="cliName" />
                                <asp:BoundField DataField="cliAddress" HeaderText="cliAddress" SortExpression="cliAddress" />
                                <asp:BoundField DataField="cityID" HeaderText="cityID" SortExpression="cityID" />
                                <asp:BoundField DataField="cliProvince" HeaderText="cliProvince" SortExpression="cliProvince" />
                                <asp:BoundField DataField="cliPCode" HeaderText="cliPCode" SortExpression="cliPCode" />
                                <asp:BoundField DataField="cliPhone" HeaderText="cliPhone" SortExpression="cliPhone" />
                                <asp:BoundField DataField="cliConFName" HeaderText="cliConFName" SortExpression="cliConFName" />
                                <asp:BoundField DataField="cliConLName" HeaderText="cliConLName" SortExpression="cliConLName" />
                                <asp:BoundField DataField="cliConPosition" HeaderText="cliConPosition" SortExpression="cliConPosition" />
                            </Columns>
                        </asp:GridView>
                        <br />
                        <asp:DropDownList ID="ddlProjectList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProjectList_SelectedIndexChanged">
                            <asp:ListItem>Select Project</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <br />
                        <asp:ObjectDataSource ID="odsProjectData" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dpcTrackr.DesignBidDataSetTableAdapters.ProjectDataTableAdapter"></asp:ObjectDataSource>
                        <br />
                        <asp:EntityDataSource ID="edsClientData" runat="server" ConnectionString="name=NBD_SBEntities" DefaultContainerName="NBD_SBEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="CLIENTs" EntityTypeFilter="CLIENT" Where="it.cliName like '%' + @cliname + '%' OR it.cliPCode like '%' + @cliPCode + '%' OR it.cliPhone like '%' + @cliPhone + '%'">
                            <WhereParameters>
                  
                                <asp:ControlParameter ControlID="txtSearchClientName" Name="cliName" PropertyName="Text" Type="string"/>
                                <asp:ControlParameter ControlID="txtSearchClientPCode" Name="cliPCode" PropertyName="Text" Type="string"/>
                                <asp:ControlParameter ControlID="txtSearchClientPhone" Name="cliPhone" PropertyName="Text" Type="string"/>
                                <asp:ControlParameter ControlID="txtSearchClientConName" Name="cliConLName" PropertyName="Text" Type="string"/>
                            </WhereParameters>
                        </asp:EntityDataSource>
                        <asp:EntityDataSource ID="edsClientName" runat="server" ConnectionString="name=NBD_SBEntities" DefaultContainerName="NBD_SBEntities" EnableFlattening="False" EntitySetName="CLIENTs" EntityTypeFilter="CLIENT" Select="it.[cliName], it.[ID]">
                        </asp:EntityDataSource>
                    </asp:Panel>
                
       </asp:View>
<asp:View ID="vNewClient" runat="server"  >
                <div id ="hectorsstuff" runat="server" visible="true">
                <asp:Panel ID="Panel1" runat="server" Width="342px" CssClass="panels2">
                    <asp:Label ID="Label19" runat="server" Font-Bold="True" Font-Size="Medium" Text="Client Information"></asp:Label>
                    <br />
                    <br />
               
                    <asp:Label ID="Label20" runat="server" Text="Name: " CssClass="smallLabels"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label21" runat="server" Text="Begin Date: " CssClass="smallLabels"></asp:Label>
                  
                    <asp:TextBox ID="datepicker" runat="server"></asp:TextBox>
                  
                    <br />  

                    <asp:Label ID="Label22" runat="server" Text="End Date: " CssClass="smallLabels"></asp:Label>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label23" runat="server" Text="Site: " CssClass="smallLabels"></asp:Label>
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label24" runat="server" Text="Bid Amount: " CssClass="smallLabels"></asp:Label>
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                    <br />
                </asp:Panel>
                <asp:Panel ID="Panel2" runat="server" Width="285px" CssClass="panels2">
                    <asp:Label ID="labelTeam" runat="server" Font-Bold="True" Font-Size="Medium" Text="Team"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label25" runat="server" Text="Sales Associate:" CssClass="smallLabels"></asp:Label>
                    <asp:TextBox ID="TextBox6" runat="server" Width="171px"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label26" runat="server" Text="Designers: " CssClass="smallLabels"></asp:Label>
                    <br/><asp:ListBox ID="lblDesigners" runat="server" Height="51px" Width="283px"></asp:ListBox>
                    <br />
                    <asp:Label ID="Label27" runat="server" Text="Workers" CssClass="smallLabels"></asp:Label>
                    <br/><asp:ListBox ID="lblWorkers" runat="server" Height="34px" Width="282px"></asp:ListBox>
                    <br />
                    <br />
                    <br />
                </asp:Panel>
                </div>
        </asp:View>
              <asp:View ID="vCreatePAR" runat="server">
                 <asp:Label ID="Label56" runat="server" Text="Select Date:"></asp:Label>
                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="100px">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#808080" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                 </asp:Calendar>
               <br />
                <asp:ImageButton ID="imgbGeneratePAR" runat="server" ImageUrl="~/Landing/icons/calculator70.png" Width="40px" /><br/><asp:Label ID="Label55" runat="server" Text="Generate PAR"></asp:Label>

                 <br />
                 <br />
                 <asp:Label ID="lblBidStageProjects" runat="server" CssClass="labels" Text="Bid Stage Projects "></asp:Label>
                 <asp:ImageButton ID="collapBidstageProject" runat="server" ImageUrl="~/Landing/icons/round60.png" OnClick="collapBidstageProject_Click" Width="25px" />
                 <br />
                 <asp:Panel ID="pnlBidStageProject" runat="server">
                 
                     <asp:GridView ID="gvPAR1" runat="server">
                     </asp:GridView>
                 
                 <br />
                     <asp:EntityDataSource ID="edsPARBidStage" runat="server">
                     </asp:EntityDataSource>


                     <br />


                 </asp:Panel>
                 <asp:Label ID="lblProdStageProjects" runat="server" CssClass="labels" Text="Production Stage Projects "></asp:Label>
                 <asp:ImageButton ID="collapProdStageProj" runat="server" ImageUrl="~/Landing/icons/round60.png" OnClick="collapProdStageProj_Click" Width="25px" />
                 <br />  <asp:Panel ID="pnlProductStageProject" runat="server">
                     <br /> 
                <asp:GridView ID="gvPAR2" runat="server"></asp:GridView>
                      <br />
                      <br />
                      </asp:Panel>
                 <br />

            </asp:View>

                
       </asp:MultiView>
    </div>
    </form>

  
</body>
</html>
