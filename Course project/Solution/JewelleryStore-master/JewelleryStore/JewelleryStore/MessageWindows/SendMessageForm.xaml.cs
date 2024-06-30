using EmailService;
using JewelleryStore.Views;
using Microsoft.EntityFrameworkCore.Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Xml.Linq;
using static Azure.Core.HttpHeader;

namespace JewelleryStore.MessageWindows
{
    /// <summary>
    /// Логика взаимодействия для SendMessageForm.xaml
    /// </summary>
    public partial class SendMessageForm : Window
    {
        private string userText;
        public string GivenName { get; set; }
        public int BillId { get; set; }
        public string DeliveryType { get; set; }
        public string ProductInfo { get; set; }
        public string Status { get; set; }
        public decimal TotalPrice { get; set; }
        public string Comment { get; set; }
        public string Email { get; set; }


        public SendMessageForm(string givenName, int billId, string deliveryType, string productInfo, string status, decimal totalPrice, string comment, string clientEmail)
        {
            InitializeComponent();
            GivenName = givenName;
            BillId = billId;
            DeliveryType = deliveryType;
            ProductInfo = productInfo;
            Status = status;
            TotalPrice = totalPrice;
            Comment = comment;
            Email = clientEmail;
            DataContext = this;
        }
        private void ExitButton_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void ButtonOK_Click(object sender, RoutedEventArgs e)
        {
            userText = messageFromTheManager.Text;

            MessageConstructor messageConstructor = new MessageConstructor("Измененения в заказе", Email);
            messageConstructor.sendMessageToClient(GivenName, BillId, DeliveryType, ProductInfo, Status, TotalPrice, userText);
            messageConstructor.SendMessage();

            MessageOK messageWindow = new MessageOK();
            messageWindow.ShowDialog();

            Close();
        }
    }
}
