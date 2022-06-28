import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/widgets/image.dart';

/// loading
class ViewStateBusyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.main,
      child: const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white))),
    );
  }
}

/// empty
// ignore: must_be_immutable
class ViewStateEmptyWidget extends StatefulWidget {
  String msg = 'viewState.no.data'.tr;

  ViewStateEmptyWidget(this.msg, {Key? key}) : super(key: key);

  @override
  State<ViewStateEmptyWidget> createState() => _ViewStateEmptyWidgetState();
}

class _ViewStateEmptyWidgetState extends State<ViewStateEmptyWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          WrapperImage(url: 'empty.png', width: 260, height: 260, imageType: ImageType.assets,),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(widget.msg, style: const TextStyle(color: AppColors.nftUnselectColor, fontSize: 17),),
          ),
        ],
      ),
    );
  }
}
//
// class ViewLoadSkeleton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SkeletonList(
//         builder: (context, index) => ListTile(
//               leading: SkeletonBox(
//                 width: 100,
//                 height: 100,
//               ),
//               title: SkeletonBox(width: CommonUtils.getScreenSize(context).width / 3 * 2, height: 18),
//               subtitle: SkeletonBox(width: CommonUtils.getScreenSize(context).width / 2, height: 15),
//             ));
//   }
// }

// /// basics Widget
// class ViewStateWidget extends StatelessWidget {
//   final String title;
//   final String message;
//   final Widget image;
//   final Widget buttonText;
//   final String buttonTextData;
//   final VoidCallback onPressed;
//
//   ViewStateWidget(
//       {Key key,
//       this.image,
//       this.title,
//       this.message,
//       this.buttonText,
//       @required this.onPressed,
//       this.buttonTextData})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var titleStyle =
//         Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.grey);
//     var messageStyle = titleStyle.copyWith(
//         color: titleStyle.color.withOpacity(0.7), fontSize: 14);
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         image ?? Icon(IconFonts.pageError, size: 80, color: Colors.grey[500]),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               Text(
//                 title ?? S.of(context).viewStateMessageError,
//                 style: titleStyle,
//               ),
//               SizedBox(height: 20),
//               ConstrainedBox(
//                 constraints: BoxConstraints(maxHeight: 200, minHeight: 150),
//                 child: SingleChildScrollView(
//                   child: Text(message ?? '', style: messageStyle),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Center(
//           child: ViewStateButton(
//             child: buttonText,
//             textData: buttonTextData,
//             onPressed: onPressed,
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// /// ErrorWidget
// class ViewStateErrorWidget extends StatelessWidget {
//   final ViewStateError error;
//   final String title;
//   final String message;
//   final Widget image;
//   final Widget buttonText;
//   final String buttonTextData;
//   final VoidCallback onPressed;
//
//   const ViewStateErrorWidget({
//     Key key,
//     @required this.error,
//     this.image,
//     this.title,
//     this.message,
//     this.buttonText,
//     this.buttonTextData,
//     @required this.onPressed,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var defaultImage;
//     var defaultTitle;
//     var errorMessage = error.message;
//     String defaultTextData = S.of(context).viewStateButtonRetry;
//     switch (error.errorType) {
//       case ViewStateErrorType.networkTimeOutError:
//         defaultImage = const Icon(Icons.error, size: 100, color: Colors.grey);
//         defaultTitle = S.of(context).viewStateMessageNetworkError;
//         // errorMessage = '';
//         break;
//       case ViewStateErrorType.defaultError:
//         defaultImage = const Icon(Icons.error, size: 100, color: Colors.grey);
//         defaultTitle = S.of(context).viewStateMessageError;
//         break;
//
//       case ViewStateErrorType.unauthorizedError:
//         return ViewStateUnAuthWidget(
//           image: image,
//           message: message,
//           buttonText: buttonText,
//           onPressed: onPressed,
//         );
//     }
//
//     return ViewStateWidget(
//       onPressed: this.onPressed,
//       image: image ?? defaultImage,
//       title: title ?? defaultTitle,
//       message: message ?? errorMessage,
//       buttonTextData: buttonTextData ?? defaultTextData,
//       buttonText: buttonText,
//     );
//   }
// }
//
// /// noDataPage
// class ViewStateEmptyWidget extends StatelessWidget {
//   final String message;
//   final Widget image;
//   final Widget buttonText;
//   final VoidCallback onPressed;
//
//   const ViewStateEmptyWidget(
//       {Key key,
//       this.image,
//       this.message,
//       this.buttonText,
//       @required this.onPressed})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ViewStateWidget(
//       onPressed: this.onPressed,
//       image: image ?? const Icon(Icons.error, size: 100, color: Colors.grey),
//       title: message ?? S.of(context).viewStateMessageEmpty,
//       buttonText: buttonText,
//       buttonTextData: S.of(context).viewStateButtonRefresh,
//     );
//   }
// }
//
// /// unAuthWidget
// class ViewStateUnAuthWidget extends StatelessWidget {
//   final String message;
//   final Widget image;
//   final Widget buttonText;
//   final VoidCallback onPressed;
//
//   const ViewStateUnAuthWidget(
//       {Key key,
//       this.image,
//       this.message,
//       this.buttonText,
//       @required this.onPressed})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ViewStateWidget(
//       onPressed: this.onPressed,
//       image: image ?? ViewStateUnAuthImage(),
//       title: message ?? S.of(context).viewStateMessageUnAuth,
//       buttonText: buttonText,
//       buttonTextData: S.of(context).viewStateButtonLogin,
//     );
//   }
// }
//
// /// unAuthImage
// class ViewStateUnAuthImage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Hero(
//       tag: 'loginLogo',
//       child: Image.asset(
//         ImageHelper.wrapAssets('login_logo.png'),
//         width: 130,
//         height: 100,
//         fit: BoxFit.fitWidth,
//         color: Theme.of(context).accentColor,
//         colorBlendMode: BlendMode.srcIn,
//       ),
//     );
//   }
// }
//
// /// public Button
// class ViewStateButton extends StatelessWidget {
//   final VoidCallback onPressed;
//   final Widget child;
//   final String textData;
//
//   const ViewStateButton({@required this.onPressed, this.child, this.textData})
//       : assert(child == null || textData == null);
//
//   @override
//   Widget build(BuildContext context) {
//     return OutlineButton(
//       child: child ??
//           Text(
//             textData ?? S.of(context).viewStateButtonRetry,
//             style: TextStyle(wordSpacing: 5),
//           ),
//       textColor: Colors.grey,
//       splashColor: Theme.of(context).splashColor,
//       onPressed: onPressed,
//       highlightedBorderColor: Theme.of(context).splashColor,
//     );
//   }
// }
