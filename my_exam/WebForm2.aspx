<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="my_exam.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <asp:DataList ID="dlQuestion" runat="server">
                        <ItemTemplate>
                            <p>
                                <%#Container.ItemIndex+1 %>
                                )
                                <%# Eval("QuestionDescription")%>
                            </p>
                            <table>
                                <tr>
                                    <td>
                                        <asp:RadioButton ID="rblOptionOne" GroupName="Questions" Text='<%# Eval("OptionOne") %>'
                                            runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:RadioButton ID="rblOptionTwo" GroupName="Questions" Text='<%# Eval("OptionTwo") %>'
                                            runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:RadioButton ID="rblOptionThree" GroupName="Questions" Text='<%# Eval("OptionThree") %>'
                                            runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:RadioButton ID="rblOptionFour" GroupName="Questions" Text='<%# Eval("OptionFour") %>'
                                            runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </td>
                <td valign="top" align="right" style="width: 500px">
                    <h2>
                        Your answers
                    </h2>
                    <table id="tbQuestion">
                        <asp:Repeater ID="rptAnswer" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <itemtemplate>
                                            <%#Container.ItemIndex+1 %>
                                        </itemtemplate>
                                    </td>
                                    <td>
                                        <asp:RadioButton ID="rblOptionOne" runat="server" GroupName="Answer" />
                                    </td>
                                    <td>
                                        <asp:RadioButton ID="rblOptionTwo" runat="server" GroupName="Answer" />
                                    </td>
                                    <td>
                                        <asp:RadioButton ID="rblOptionThree" runat="server" GroupName="Answer" />
                                    </td>
                                    <td>
                                        <asp:RadioButton ID="rblOptionFour" runat="server" GroupName="Answer" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </td>
            </tr>
        </table>
        </div>
    </form>
</body>
</html>
