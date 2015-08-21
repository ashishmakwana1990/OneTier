<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DetailsViewExa.aspx.cs" Inherits="ListViewExa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" Font-Size="Large" Height="135px" OnItemCommand="DetailsView1_ItemCommand" OnModeChanging="DetailsView1_ModeChanging" OnPageIndexChanging="DetailsView1_PageIndexChanging" Width="457px" DataKeyNames="pid">
            <Fields>
                <asp:TemplateField HeaderText="First Name ::">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fname") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("fname") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("fname") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Last Name ::">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("lname") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("lname") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("lname") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="City ::">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("city") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("city") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:LinkButton ID="lbupdate" runat="server" OnClick="lbupdate_Click">Update</asp:LinkButton>
                        &nbsp;
                        <asp:LinkButton ID="lbupdatecancel" runat="server" CommandName="Cancel">Cancel</asp:LinkButton>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:LinkButton ID="lbinsert" runat="server" OnClick="lbinsert_Click">Insert</asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="lbinsertcancel" runat="server" CommandName="Cancel">Cancel</asp:LinkButton>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="lbedit" runat="server" CommandName="Edit">Edit</asp:LinkButton>
                        &nbsp;
                        <asp:LinkButton ID="lbdelete" runat="server" OnClick="lbdelete_Click">Delete</asp:LinkButton>
                        &nbsp;
                        <asp:LinkButton ID="lbnew" runat="server" CommandName="New">New</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Fields>
        </asp:DetailsView>
    
    </div>
    </form>
</body>
</html>
