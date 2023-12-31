<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testselection.aspx.cs" Inherits="my_exam.testselection" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            border-style: solid;
            border-width: 1px;
            background-color: #6699FF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <table class="auto-style1">
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Select a test</td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList ID="testlist" runat="server" DataSourceID="SqlDataSource1" DataTextField="settype" DataValueField="settype">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT DISTINCT [settype] FROM [question]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
