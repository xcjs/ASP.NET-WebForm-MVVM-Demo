<%@ Page Title="Account Home" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
	CodeBehind="Default.aspx.cs" Inherits="MVVMDemo._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
	<asp:ObjectDataSource runat="server" ID="dataUser" 
		TypeName="MVVMDemo.ViewModels.Account.UserViewModel" DataObjectTypeName="MVVMDemo.Entities.User" 
		OnObjectCreating="dataUser_OnObjectCreating" SelectMethod="get_User" UpdateMethod="SaveUser" />
        
    <asp:ObjectDataSource runat="server" ID="dataUserSkills" 
		TypeName="MVVMDemo.ViewModels.Account.UserViewModel" DataObjectTypeName="MVVMDemo.Entities.UserSkill"
		OnObjectCreating="dataUser_OnObjectCreating" DeleteMethod="DeleteSkill" SelectMethod="get_UserSkills" UpdateMethod="SaveUserSkill" InsertMethod="InsertUserSkill" />

	<asp:FormView runat="server" ID="frmUser" DataSourceID="dataUser" OnModeChanging="frmUser_OnModeChanging" DataKeyNames="ID">
		<HeaderTemplate>
			<h2>
				Tell us about yourself
			</h2>
		</HeaderTemplate>
		<EmptyDataTemplate>
			<p>
				It doesn't look like you have registered. Would you like to
				<asp:LinkButton runat="server" ID="lnkRegister" EnableViewState="false" CommandName="Edit">register</asp:LinkButton>?
			</p>
		</EmptyDataTemplate>
		<ItemTemplate>
			<address>
				<%# Eval("FirstName")%> <%# Eval("LastName")%>
				<br />
				<%# Eval("Address") %>
				<br />
				<%# Eval("Address2") != null ? Eval("Address2") + "<br />" : null %>
				<%# Eval("City") %>, <%# Eval("State") %>
				<%# Eval("Zip") %>
			</address>
            
            <br/>

			<p>
				<asp:Button runat="server" ID="btnEdit" Text="Edit" CommandName="Edit" />
			</p>
            
		</ItemTemplate>
		<EditItemTemplate>
			<table>
				<tbody>
					<tr>
						<td>
							<asp:Label runat="server" AssociatedControlID="txtFirstName">First Name:</asp:Label>
						</td>
						<td>
							<asp:TextBox runat="server" ID="txtFirstName" Text='<%# Bind("FirstName") %>' />
						</td>
					</tr>
					<tr>
						<td>
							<asp:Label runat="server" AssociatedControlID="txtLastName">Last Name:</asp:Label>
						</td>
						<td>
							<asp:TextBox runat="server" ID="txtLastName" Text='<%# Bind("LastName") %>' />
						</td>
					</tr>
					<tr>
						<td>
							<asp:Label runat="server" AssociatedControlID="txtLastName">Address:</asp:Label>
						</td>
						<td>
							<asp:TextBox runat="server" ID="txtAddress" Text='<%# Bind("Address") %>' />
						</td>
					</tr>
					<tr>
						<td>
							<asp:Label runat="server" AssociatedControlID="txtAddress2">Address 2:</asp:Label>
						</td>
						<td>
							<asp:TextBox runat="server" ID="txtAddress2" Text='<%# Bind("Address2") %>' />
						</td>
					</tr>
					<tr>
						<td>
							<asp:Label runat="server" AssociatedControlID="txtCity">City:</asp:Label>
						</td>
						<td>
							<asp:TextBox runat="server" ID="txtCity" Text='<%# Bind("City") %>' />
						</td>
					</tr>
					<tr>
						<td>
							<asp:Label runat="server" AssociatedControlID="txtState">State:</asp:Label>
						</td>
						<td>
							<asp:TextBox runat="server" ID="txtState" Text='<%# Bind("State") %>' />
						</td>
					</tr>
					<tr>
						<td>
							<asp:Label runat="server" AssociatedControlID="txtZip">Zip:</asp:Label>
						</td>
						<td>
							<asp:TextBox runat="server" ID="txtZip" Text='<%# Bind("Zip") %>' />
						</td>
					</tr>
				</tbody>
			</table>
			<p>
				<asp:Button runat="server" ID="btnSave" Text="Save" CommandName="Update" />
			</p>
		</EditItemTemplate>
		<FooterTemplate>
		
		</FooterTemplate>
		
	</asp:FormView>
    
    <asp:ListView ID="lvSkills" runat="server" DataSourceID="dataUserSkills" InsertItemPosition="LastItem" DataKeyNames="UserSkillId">
        
        
        <LayoutTemplate>
            <p>Skills</p>
            <p runat="server" id="itemPlaceholder">
                    </p>
                    
                    <br/>
            
        </LayoutTemplate>        
        
        <ItemTemplate>
            <%# Eval("Description") %>
            <asp:Button runat="server" ID="btnSaveSkill" Text="Edit" CommandName="Edit" />
            <br/>
        </ItemTemplate>
        
        <EditItemTemplate>
            <asp:HiddenField ID="hdnUserId" runat="server" Value='<%# Bind("UserId") %>' Visible="false" />
            <asp:HiddenField ID="hdnUserSkillId" runat="server" Value='<%# Bind("UserSkillId") %>' Visible="false" />
            <asp:TextBox runat="server" ID="txtDescription" Text='<%# Bind("Description") %>' />
            <asp:Button runat="server" ID="btnUpdateSkill" Text="Save" CommandName="Update" />
            <asp:Button runat="server" ID="btnRemoveSkill" Text="Remove" CommandName="Delete" />
            <br/>
        </EditItemTemplate>

        <InsertItemTemplate>
            <asp:HiddenField ID="hdnUserId" runat="server" Value='<%# Bind("UserId") %>' Visible="false" />
            <asp:HiddenField ID="hdnUserSkillId" runat="server" Value='<%# Bind("UserSkillId") %>' Visible="false" />
            <asp:TextBox runat="server" ID="txtDescription" Text='<%# Bind("Description") %>' />
            <asp:Button runat="server" ID="btnAddSkill" Text="Add" CommandName="Insert" />     
        </InsertItemTemplate>

     </asp:ListView>

</asp:Content>
