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
    /// Логика взаимодействия для DeliveryOrPickupWindow.xaml
    /// </summary>
    public partial class DeliveryOrPickupWindow : Window
    {
        public DeliveryOrPickupWindow()
        {
            InitializeComponent();
        }
        private void ExitButton_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
        private void DeliveryButton_Click(object sender, RoutedEventArgs e)
        {
            Window mainWindow = Window.GetWindow(this);
            mainWindow.Close();

            DeliveryForm deliveryForm = new DeliveryForm();
            deliveryForm.ShowDialog();
        }
        private void PickupButton_Click(object sender, RoutedEventArgs e)
        {
            Window mainWindow = Window.GetWindow(this);
            mainWindow.Close();

            selectingPickupAddress window = new selectingPickupAddress();
            window.Show();
        }
    }
}
