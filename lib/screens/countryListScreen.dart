import 'package:egrocer/helper/generalWidgets/countryItemContainer.dart';
import 'package:egrocer/helper/utils/generalImports.dart';

class CountryListScreen extends StatefulWidget {
  const CountryListScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CountryListScreen> createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  @override
  void initState() {
    super.initState();
    //fetch countryList from api
    Future.delayed(Duration.zero).then((value) {
      Map<String, String> params = {};
      context
          .read<CountryProvider>()
          .getCountryProvider(context: context, params: params);
    });
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
          context: context,
          title: CustomTextLabel(
            jsonKey: "country_of_origin",
            style: TextStyle(color: ColorsRes.mainTextColor),
          ),
          actions: [
            setCartCounter(context: context),
          ],
          showBackButton: true),
      body: Column(
        children: [
          getSearchWidget(
            context: context,
          ),
          Expanded(
            child: setRefreshIndicator(
              refreshCallback: () {
                Map<String, String> params = {};
                return context
                    .read<CountryProvider>()
                    .getCountryProvider(context: context, params: params);
              },
              child: ListView(
                children: [countryWidget()],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //countryList ui
  Widget countryWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Consumer<CountryProvider>(
          builder: (context, countryListProvider, _) {
            if (countryListProvider.countryState == CountryState.loaded) {
              return Card(
                color: Theme.of(context).cardColor,
                surfaceTintColor: Theme.of(context).cardColor,
                elevation: 0,
                margin: EdgeInsets.symmetric(
                    horizontal: Constant.size10, vertical: Constant.size10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GridView.builder(
                      itemCount: countryListProvider.countries.length,
                      padding: EdgeInsets.symmetric(
                          horizontal: Constant.size10,
                          vertical: Constant.size10),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        CountryItem country =
                            countryListProvider.countries[index];

                        return CountryItemContainer(
                          country: country,
                          voidCallBack: () {
                            Navigator.pushNamed(context, productListScreen,
                                arguments: [
                                  "country",
                                  country.id.toString(),
                                  country.name,
                                ]);
                          },
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.8,
                              crossAxisCount: 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                    ),
                  ],
                ),
              );
            } else if (countryListProvider.countryState ==
                CountryState.loading) {
              return getCategoryShimmer(context: context, count: 9);
            } else {
              return NoInternetConnectionScreen(
                height: context.height * 0.65,
                message: countryListProvider.message,
                callback: () {
                  Map<String, String> params = {};

                  context
                      .read<CountryProvider>()
                      .getCountryProvider(context: context, params: params);
                },
              );
            }
          },
        ),
      ],
    );
  }
}
