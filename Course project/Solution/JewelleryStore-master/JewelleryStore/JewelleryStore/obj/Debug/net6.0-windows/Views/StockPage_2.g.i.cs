﻿#pragma checksum "..\..\..\..\Views\StockPage_2.xaml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "3DC4EF520913F8D21A3A64A92B80A4C739DB284A"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

using JewelleryStore.Views;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Controls.Ribbon;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace JewelleryStore.Views {
    
    
    /// <summary>
    /// StockPage
    /// </summary>
    public partial class StockPage : System.Windows.Controls.Page, System.Windows.Markup.IComponentConnector {
        
        
        #line 22 "..\..\..\..\Views\StockPage_2.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button ChangePromotionBtn_1;
        
        #line default
        #line hidden
        
        
        #line 26 "..\..\..\..\Views\StockPage_2.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Shapes.Rectangle image1;
        
        #line default
        #line hidden
        
        
        #line 31 "..\..\..\..\Views\StockPage_2.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button SaveChangesBtn;
        
        #line default
        #line hidden
        
        
        #line 35 "..\..\..\..\Views\StockPage_2.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox quantityField;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "7.0.12.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/JewelleryStore;V1.0.0.0;component/views/stockpage_2.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\..\Views\StockPage_2.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "7.0.12.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.ChangePromotionBtn_1 = ((System.Windows.Controls.Button)(target));
            
            #line 23 "..\..\..\..\Views\StockPage_2.xaml"
            this.ChangePromotionBtn_1.Click += new System.Windows.RoutedEventHandler(this.ChangePromotionBtn_Click);
            
            #line default
            #line hidden
            return;
            case 2:
            this.image1 = ((System.Windows.Shapes.Rectangle)(target));
            return;
            case 3:
            this.SaveChangesBtn = ((System.Windows.Controls.Button)(target));
            
            #line 32 "..\..\..\..\Views\StockPage_2.xaml"
            this.SaveChangesBtn.Click += new System.Windows.RoutedEventHandler(this.SaveChangesButton_Click);
            
            #line default
            #line hidden
            return;
            case 4:
            this.quantityField = ((System.Windows.Controls.TextBox)(target));
            return;
            }
            this._contentLoaded = true;
        }
    }
}
