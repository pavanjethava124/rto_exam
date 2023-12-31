<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="paperview.aspx.cs" Inherits="my_exam.paperview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 23px; 
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Select a question paper to preview<br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="testlist" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource1" DataTextField="settype" DataValueField="settype" OnSelectedIndexChanged="testlist_SelectedIndexChanged"> 
            </asp:DropDownList>
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT DISTINCT [settype] FROM [question] ORDER BY [settype]"></asp:SqlDataSource>
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <br />
            <br />
            <table border="1">
                <tr>
                    <td class="auto-style1">
                        QID
                    </td>
                    <td class="auto-style1">
                        Question
                    </td>
                    <td class="auto-style1">
                        Choice
                    </td>
                    <td class="auto-style1"></td>
                </tr>
                <%
                    while (dr.Read())
                    { %><% ans = Convert.ToInt16(dr.GetValue(7)); %>

                <%
                    if (ans == 1)
                    {
                        CheckBox1.Checked = true;
                        CheckBox2.Checked = false;
                        CheckBox3.Checked = false;
                        CheckBox4.Checked = false;
                    }
                    %>
                 <%
                     if (ans == 2)
                     {
                         CheckBox1.Checked = false;
                         CheckBox2.Checked = true;
                         CheckBox3.Checked = false;
                         CheckBox4.Checked = false;
                     }
                    %>
                 <%
                     if (ans == 3)
                     {
                         CheckBox1.Checked = false;
                         CheckBox2.Checked = false;
                         CheckBox3.Checked = true;
                         CheckBox4.Checked = false;
                     }
                    %>
                 <%
                     if (ans == 4)
                     {
                         CheckBox1.Checked = false;
                         CheckBox2.Checked = false;
                         CheckBox3.Checked = false;
                         CheckBox4.Checked = true;
                     }
                    %>
                <tr>
                    <td>
                        <%= dr.GetValue(0) %>
                    </td>
                    <td>
                        <%= dr.GetValue(1) %>
                    </td>
                    <td>
                        <table border="1">
                            <%= dr.GetValue(3) %>
                        <td>
                            <asp:CheckBox ID="CheckBox1" runat="server" />
                        </td>
                            <tr>
                                <td><%= dr.GetValue(4) %></td>
                            </tr>
                       <td>
                            <asp:CheckBox ID="CheckBox2" runat="server" />
                        </td>
                            <tr>
                                <td><%= dr.GetValue(5) %></td>
                            </tr>
                        <td>
                            <asp:CheckBox ID="CheckBox3" runat="server" />
                        </td>
                            <tr>
                                <td><%= dr.GetValue(6) %></td>
                            </tr>
                        <td>
                            <asp:CheckBox ID="CheckBox4" runat="server" />
                        </td>
                        
                            </table>
                        <td> <a href="edit.aspx?settype=<% Response.Write(dr.GetValue(2)); %>&qid=<%Response.Write(dr.GetValue(0)); %>"><b>Edit<br />or<br />Delete</b></a></td>
                    </td>
                    <% 
                        } %>
                </tr>
                <tr>
                    <td>
                        <table border="1">
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:Button ID="Button1" runat="server" Text="Add que" OnClick="Button1_Click" />
                                    
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
