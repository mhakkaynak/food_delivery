import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../product/constants/enum/payment_enum.dart';
import '../../../../product/constants/image_path.dart';
import '../../../../product/extension/payment_extension.dart';
import '../../../../product/widgets/button/elevated_text_button.dart';
import '../../../../product/widgets/card/payment_card.dart';
import '../cubit/payment_cubit.dart';
import '../model/payment_model.dart';

class PaymentView extends StatelessWidget {
  PaymentView({Key key}) : super(key: key);

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        'Checkout',
        style: context.currentTheme.textTheme.headline5,
      ),
    );
  }

  PaymentCard _buildPaymentMethodCard(
      PaymentState state, BuildContext context) {
    return PaymentCard(
      text1: 'Card',
      text2: 'Bank account',
      radioButton1: Radio<PaymentMethod>(
          value: PaymentMethod.CARD,
          groupValue: state.paymentMethod,
          onChanged: (value) {
            context
                .read<PaymentCubit>()
                .changePaymentMethod(value, state.deliveryMethod);
          }),
      radioButton2: Radio<PaymentMethod>(
          value: PaymentMethod.BANK_ACCOUNT,
          groupValue: state.paymentMethod,
          onChanged: (value) {
            context
                .read<PaymentCubit>()
                .changePaymentMethod(value, state.deliveryMethod);
          }),
      iconPath1: ImagePath.instance.cardIcon,
      iconPath2: ImagePath.instance.bankIcon,
    );
  }

  PaymentCard _buildDeliveryMethodCard(
      PaymentState state, BuildContext context) {
    return PaymentCard(
      text1: 'Door delivery',
      text2: 'Pick up',
      radioButton1: Radio<DeliveryMethod>(
          value: DeliveryMethod.DOOR_DELIVERY,
          groupValue: state.deliveryMethod,
          onChanged: (value) {
            context
                .read<PaymentCubit>()
                .changeDeliveryMethod(value, state.paymentMethod);
          }),
      radioButton2: Radio<DeliveryMethod>(
          value: DeliveryMethod.PICK_UP,
          groupValue: state.deliveryMethod,
          onChanged: (value) {
            context
                .read<PaymentCubit>()
                .changeDeliveryMethod(value, state.paymentMethod);
          }),
      iconPath1: ImagePath.instance.doorDeliveryIcon,
      iconPath2: ImagePath.instance.pickUpIcon,
    );
  }

  Row _buildRowText(BuildContext context, PaymentState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildText(context, 'Total'),
        _buildText(context, ' ${state.totalPrice} \$'),
      ],
    );
  }

  ElevatedTextButton _buildElevatedTextButton(
      BuildContext context, PaymentState state) {
    return ElevatedTextButton(
        onPressed: () {
          context.read<PaymentCubit>().pay(
              PaymentModel(
                  state.deliveryMethod.rawValue, state.paymentMethod.rawValue),
              (text) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(text)));
            return null;
          });
        },
        text: 'Proceed to payment');
  }

  Text _buildText(BuildContext context, String text, {TextStyle textStyle}) {
    return Text(
      text,
      style: textStyle ?? context.currentTheme.textTheme.bodyText1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: context.paddingLowSymetric,
        child: BlocBuilder<PaymentCubit, PaymentState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildText(
                  context,
                  'Payment',
                  textStyle: context.currentTheme.textTheme.headline4,
                ),
                _buildText(context, 'Payment method'),
                _buildPaymentMethodCard(state, context),
                _buildText(context, 'Delivery method'),
                _buildDeliveryMethodCard(state, context),
                _buildRowText(context, state),
                _buildElevatedTextButton(context, state)
              ],
            );
          },
        ),
      ),
    );
  }
}
