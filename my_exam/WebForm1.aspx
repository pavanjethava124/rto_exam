<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="my_exam.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="testlist" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource1" DataTextField="settype" DataValueField="settype" Height="16px" OnSelectedIndexChanged="testlist_SelectedIndexChanged" Width="116px">
            </asp:DropDownList>
&nbsp;
            <asp:TextBox ID="testname" runat="server" Visible="false" BackColor="#9999FF"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="ntest" runat="server" Text="New test" OnClick="ntest_Click" />
            <asp:Label ID="msg1" runat="server" Text="[msg1]"></asp:Label>
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT DISTINCT [settype] FROM [question] ORDER BY [settype]"></asp:SqlDataSource>
            <br />
            <br />
            <asp:TextBox ID="question" runat="server" BackColor="#9999FF" Height="47px" Width="358px"></asp:TextBox>
&nbsp;<asp:Label ID="msg2" runat="server" Text="[msg2]"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="opt1" runat="server" BackColor="#66CCFF" Height="16px" OnTextChanged="TextBox3_TextChanged" Width="340px"></asp:TextBox>
&nbsp;&nbsp;
            <asp:RadioButton ID="RadioButton1" runat="server" Checked="true" GroupName="opt"/>
&nbsp;
            <asp:Label ID="msg3" runat="server" Text="[msg3]"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="opt2" runat="server" BackColor="#66CCFF" Height="16px" OnTextChanged="TextBox3_TextChanged" Width="340px"></asp:TextBox>
&nbsp;&nbsp;
            <asp:RadioButton ID="RadioButton2" runat="server" GroupName="opt" />
&nbsp;<asp:Label ID="msg4" runat="server" Text="[msg4]"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="opt3" runat="server" BackColor="#66CCFF" Height="16px" OnTextChanged="TextBox3_TextChanged" Width="340px"></asp:TextBox>
&nbsp;&nbsp;
            <asp:RadioButton ID="RadioButton3" runat="server"  GroupName="opt"/>
&nbsp;
            <asp:Label ID="msg5" runat="server" Text="[msg5]"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="opt4" runat="server" BackColor="#66CCFF" Height="16px" OnTextChanged="TextBox3_TextChanged" Width="340px"></asp:TextBox>
&nbsp;
            <asp:RadioButton ID="RadioButton4" runat="server" GroupName="opt" />
&nbsp;
            <asp:Label ID="msg6" runat="server" Text="[msg6]"></asp:Label>
            <br />
            <br />
            <asp:Label ID="msg7" runat="server" Text="[msg7]"></asp:Label>
            <br />
            <br />
            <asp:Button ID="submit" runat="server" Text="Add que" OnClick="Button2_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="paperview" runat="server" Text="view" OnClick="paperview_Click" />
            <br />
        </div>
    </form>
</body>
</html>
