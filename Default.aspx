<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td>First Name ::&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtfn" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Last Name ::&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtln" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>City ::&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtcity" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnsubmit" runat="server" OnClick="btnsubmit_Click" Text="Submit" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="pid" GridLines="None" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" ShowFooter="True" OnRowCommand="GridView1_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="Select">
                                <FooterTemplate>
                                    <asp:Button ID="Button1" runat="server" CommandName="DeleteAll" Text="DeleteAll" />
                                </FooterTemplate>
                                <HeaderTemplate>
                                    <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" Text="SelectAll" OnCheckedChanged="CheckBox2_CheckedChanged1" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="FirstName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fname") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("fname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="LastName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("lname") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("lname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="City">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("city") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#594B9C" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#33276A" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/DetailsViewExa.aspx">DetailsView</asp:HyperLink>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
