import 'package:bukit_vista_app/model.dart';
import 'package:bukit_vista_app/theme.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final Guest guest;

  static const routeName = '/detailPage';

  const DetailPage({super.key, required this.guest});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Tab> myTabs = const <Tab>[
    Tab(
      text: 'Overview',
    ),
    Tab(
      text: 'Bookings',
    ),
    Tab(
      text: 'Personas',
    ),
  ];

  // init state dan dispose for lifcycle tab bar
  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: myTabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Guest Details', style: titleAppbar),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 24,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            _buildCardGuest(context, widget.guest),
            TabBar(
                controller: _tabController,
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.lightBlue,
                tabs: myTabs),
            Expanded(
                child: TabBarView(controller: _tabController, children: [
              _overView(context, widget.guest),
              ListView.builder(
                  itemCount: widget.guest.bookings.length,
                  itemBuilder: (context, index) {
                    return _booking(context, widget.guest.bookings[index]);
                  }),
              const Text('personas'),
            ]))
          ],
        ));
  }

  Widget _buildCardGuest(BuildContext context, Guest guest) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Color(0xff777676),
                  width: 0.1,
                ),
                borderRadius: BorderRadius.circular(10)),
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(180),
                    child: Image.network(
                      guest.pictureId,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(guest.name, style: titleList),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Guest start ${guest.start}",
                          style: subtitleList,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }

  Widget _overView(BuildContext context, Guest guest) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: subtitleList,
            ),
            Text(
              guest.email,
              style: subtitleList.copyWith(color: Colors.black),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Phone Number',
              style: subtitleList,
            ),
            Text(
              guest.phoneNumber,
              style: subtitleList.copyWith(color: Colors.black),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Guest Origin',
              style: subtitleList,
            ),
            Text(
              guest.location,
              style: subtitleList.copyWith(color: Colors.black),
            ),
          ],
        ));
  }

  Widget _booking(BuildContext context, Booking booking) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 5),
      child: Card(
        shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Color(0xff777676),
              width: 0.1,
            ),
            borderRadius: BorderRadius.circular(10)),
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.only(top: 12, left: 12, bottom: 8),
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        color: const Color(0xffFBEAC6),
                        borderRadius: BorderRadius.circular(100)),
                    child: const Icon(
                      Icons.home_outlined,
                      color: Colors.orange,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        booking.idBooking,
                        style: titleList,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        booking.placeBooking,
                        style: subtitleList.copyWith(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(booking.timePeriod, style: subtitleList),
                    ],
                  ),

                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
                    color: booking.status == true
                        ? const Color(0xffC1F0C0)
                        : const Color(0xffFFCCCC),
                  ),
                  width: 100,
                  height: 30,
                  child: Center(
                      child: booking.status == true
                          ? Text('Confirmed', style: subtitleList.copyWith(
                          color: Colors.green
                      ),)
                          : Text('Canceled', style: subtitleList.copyWith(
                          color: Colors.red
                      ),)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
