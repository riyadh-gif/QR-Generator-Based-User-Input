<%@ Page Title="QRCode" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="cobaBarcode227._Default" EnableViewState="true" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <head>
        <!-- Fonts -->
        <title>Angkasa Pura</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

        <!-- CSS Media Queries -->
        <style type="text/css">
            /* Gaya umum untuk layar besar */
            body {
                font-size: 18px;
            }

            label, input, button {
                width: 100%; /* Lebar elemen mengikuti lebar parent */
                margin-bottom: 10px; /* Margin bawah antar elemen */
            }

            /* Gaya untuk layar kecil (misalnya, perangkat seluler) */
            @media only screen and (max-width: 600px) {
                body {
                    font-size: 14px;
                }
            }
        </style>
    </head>
    <body>
        <table style="width: 100%; height: 100%;">
            <tr>
                <td style="width: 19%; height: 100%;">
                    <div class="tittle">
                        <h3>GET YOUR
                            <br>BARCODE</br>
                        </h3>
                        <span>Create your barcode easily</span>
                    </div>
                </td>
                <td style="width: 24%; height: 100%;">
                    <div class="input">
                        <h4>Generate your barcode by filling out the form below :</h4>
                        <div class="input-label">
                            <label for="txtNIP">NIP :</label>
                            <asp:TextBox ID="txtNIP" runat="server" CssClass="form-control" placeholder="Enter NIP" EnableViewState="true" Width="632px" oninput="generateAndDisplayQRCode()" OnTextChanged="txtNIP_TextChanged1"></asp:TextBox>
                            <br>
                            <label for="txtNama">Name :</label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Name" EnableViewState="true" Width="628px" OnTextChanged="txtName_TextChanged"></asp:TextBox>
                            <br>
                            <label for="txtUnit">Unit :</label>
                            <asp:TextBox ID="txtUnit" runat="server" CssClass="form-control" placeholder="Enter Unit" EnableViewState="true" Width="632px" OnTextChanged="txtUnit_TextChanged"></asp:TextBox>
                            <br>
                            <label for="txtEmail">Email :</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Email" EnableViewState="true" Width="630px" OnTextChanged="txtEmail_TextChanged"></asp:TextBox>
                            <asp:HiddenField ID="hfQrCodeSent" runat="server" Value="false" />
                        </div>
                        <br>
                            <div class="input-group send-email-button">
                                <asp:Button ID="btnSendEmail" runat="server" Text="Send Email" OnClick="btnSendEmail_Click" CssClass="btn btn-success" />

                                <br>
                                <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Green"></asp:Label>
                                <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="red"></asp:Label>
                            </div>
                        </br>
                    </div>
                </td>
                <td style="width: 10%; height: 443px;">
                    <!-- Atur lebar tetap untuk kolom barcode -->
                    <div class="barcode-image">
                        <!-- Gambar Barcode -->
                        <br>
                        <br>
                        <br>
                            <asp:Image ID="imgBarcode" runat="server" Style="margin-bottom: 10px; max-width: 100%;" />
                            <br></br>
                        </br>
                    </div>
                </td>
            </tr>
        </table>

        <script type="text/javascript">
            // Function to generate QR code and display it
            function generateAndDisplayQRCode() {
                var nip = document.getElementById('<%= txtNIP.ClientID %>').value;
                var nama = document.getElementById('<%= txtName.ClientID %>').value;
                var unit = document.getElementById('<%= txtUnit.ClientID %>').value;
                var email = document.getElementById('<%= txtEmail.ClientID %>').value;

               // if (!/^\d+$/.test(nip)) {
               //     alertError("NIP must be a numeric value.");
                 //   return;
                //}

                var qrCodeData = `NIP: ${nip}, Nama: ${nama}, Unit: ${unit}, Email: ${email}`;
                var qrCodeUrl = generateQRCodeUrl(qrCodeData);

                document.getElementById('<%= imgBarcode.ClientID %>').src = qrCodeUrl;
            }

            // Function to generate QR code URL
            function generateQRCodeUrl(data) {
                return "https://api.qrserver.com/v1/create-qr-code/?size=300x300&data=" + encodeURIComponent(data);
            }

            // Function to display error message
            function alertError(errorMessage) {
                var errorDiv = document.createElement('div');
                errorDiv.className = 'error-message';
                errorDiv.innerText = errorMessage;

                document.body.appendChild(errorDiv);

                setTimeout(function () {
                    errorDiv.style.opacity = '0';
                    setTimeout(function () {
                        document.body.removeChild(errorDiv);
                    }, 300);
                }, 2000);
            }

            // Function to display success message
            function showMessage(message) {
                var messageBox = document.querySelector('.message-box');
                var messageText = document.querySelector('.message-text');

                messageText.innerText = message;
                messageBox.style.display = 'block';

                setTimeout(function () {
                    messageBox.style.opacity = '0';
                    setTimeout(function () {
                        messageBox.style.display = 'none';
                        messageBox.style.opacity = '1';
                    }, 300);
                }, 2000);
            }
        </script>
    </body>
</asp:Content>
