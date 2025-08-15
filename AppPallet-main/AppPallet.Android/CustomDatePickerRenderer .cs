using Xamarin.Forms;
using Xamarin.Forms.Platform.Android;
using AppPallet;
using AppPallet.Droid;
using Android.Content;
using Android.Content.Res;

[assembly: ExportRenderer(typeof(CustomDatePicker), typeof(CustomDatePickerRenderer))]
namespace AppPallet.Droid
{
    public class CustomDatePickerRenderer : DatePickerRenderer
    {
        public CustomDatePickerRenderer(Context context) : base(context)
        {
        }

        protected override void OnElementChanged(ElementChangedEventArgs<DatePicker> e)
        {
            base.OnElementChanged(e);

            if (Control != null)
            {
                // Remove a linha de sublinhado
                Control.Background = null;
                Control.SetTextColor(global::Android.Graphics.Color.DarkGray);
                Control.SetHintTextColor(ColorStateList.ValueOf(global::Android.Graphics.Color.DarkGray));
            }
        }
    }
}
