using Microsoft.Data.SqlClient;
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

namespace JewelleryStore.MessageWindows
{
    /// <summary>
    /// Логика взаимодействия для ChangeStatus.xaml
    /// </summary>
    public partial class ChangeStatus : Window
    {
        private int billId;
        private string givenName;
        private string deliveryType;
        private string productInfo;
        private decimal totalPrice;
        private string comment;
        private string clientEmail;
        public ChangeStatus(int billId, string givenName,
        string deliveryType,
        string productInfo,
        decimal totalPrice,
        string comment,
        string clientEmail)
        {
            InitializeComponent();
            this.billId = billId;
            this.givenName = givenName;
            this.deliveryType = deliveryType;
            this.productInfo = productInfo;
            this.totalPrice = totalPrice;
            this.comment = comment;
            this.clientEmail = clientEmail;
        }
        private void ButtonOK_Click(object sender, RoutedEventArgs e)
        {
            ComboBoxItem selectedItem = StatusComboBox.SelectedItem as ComboBoxItem;
            string selectedStatus = selectedItem.Content.ToString();

            if (selectedStatus == "Изменить статус заказа" || selectedStatus == "Change order status")
            {
                ChooseStatusError chooseStatusErrorWindow = new ChooseStatusError();
                chooseStatusErrorWindow.ShowDialog();
            }
            else
            {
                string connectionString = "Server=localhost,1433;Database=AppDB;User Id=sa;Password=aaaa_1111;Trusted_Connection=False;MultipleActiveResultSets=true;TrustServerCertificate=True";
                string updateQuery = $"UPDATE BILL SET Status = N'{selectedStatus}' WHERE BillId = {billId}";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand(updateQuery, connection);
                    command.ExecuteNonQuery();
                }


                MessageOK messageWindow = new MessageOK();
                messageWindow.ShowDialog();

                Close();
                SendMessageForm sendMessageForm = new SendMessageForm(givenName, billId, deliveryType, productInfo, selectedStatus, totalPrice, comment, clientEmail);
                sendMessageForm.Show();
            }
        }
        public void ExitButton_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
