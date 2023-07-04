part of '../screens.dart';

class CheckMac extends StatefulWidget {
  const CheckMac({Key? key}) : super(key: key);

  @override
  State<CheckMac> createState() => _CheckMacState();
}

class _CheckMacState extends State<CheckMac> {
  String _connectionStatus = 'Unknown';
  final NetworkInfo _networkInfo = NetworkInfo();

  @override
  void initState() {
    super.initState();
    _initNetworkInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Activating Account',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.grey,
        child: Icon(
          Icons.update,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                width: 100.w,
                child: Image.network(
                    'https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg'),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xff8998FE),
                    ),
                    margin: EdgeInsets.only(left: 10.0),
                    width: 20.w,
                    height: 8.h,
                    child: Icon(
                      Icons.network_check,
                      size: 10.w,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10.0),
                    width: 70.w,
                    height: 9.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                        child: Container(
                          padding: EdgeInsets.only(top: 1.3.h),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.15),
                          ),
                          child: TextButton(
                            onPressed: (){
                              Clipboard.setData(ClipboardData(text: _connectionStatus));
                            },
                            child: Text(
                              _connectionStatus.substring(3).toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 30.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 25.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xff8998FE),
                    ),
                    margin: EdgeInsets.only(left: 10.0),
                    width: 20.w,
                    height: 8.h,
                    child: Icon(
                      Icons.key,
                      size: 10.w,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10.0),
                    width: 70.w,
                    height: 9.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.15),
                          ),
                          child: TextButton(
                            onPressed: (){
                              Clipboard.setData(ClipboardData(text: '1544d121'));
                            },
                            child: Text(
                              '1544d121'.toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 30.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _initNetworkInfo() async {
    String? wifiBSSID;

    try {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.locationWhenInUse,
        Permission.location,
      ].request();
      if (await Permission.locationWhenInUse.request().isGranted && await Permission.location.request().isGranted) {
        try {
          if (!kIsWeb && Platform.isIOS) {
            var status = await _networkInfo.getLocationServiceAuthorization();
            if (status == LocationAuthorizationStatus.notDetermined) {
              status = await _networkInfo.requestLocationServiceAuthorization();
            }
            if (status == LocationAuthorizationStatus.authorizedAlways ||
                status == LocationAuthorizationStatus.authorizedWhenInUse) {
              wifiBSSID = await _networkInfo.getWifiBSSID();
            } else {
              wifiBSSID = await _networkInfo.getWifiBSSID();
            }
          } else {
            wifiBSSID = await _networkInfo.getWifiBSSID();
          }
        } on PlatformException catch (e) {
          developer.log('Failed to get Wifi BSSID', error: e);
          wifiBSSID = 'Permission denied !!';
        }
      }
    } catch (esx) {
      print(esx);
    }

    setState(() {
      _connectionStatus = '$wifiBSSID\n';
      print(_connectionStatus);
    });
  }
}
