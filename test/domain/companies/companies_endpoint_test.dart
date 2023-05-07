import 'package:coingecko_client/src/domain/companies/companies_endpoint.dart';
import 'package:coingecko_client/src/models/exceptions/data_parsing_exception.dart';
import 'package:coingecko_client/src/models/exceptions/network_request_exception.dart';
import 'package:test/test.dart';

import '../../services/http_request_service_mock.dart';
import 'mock/companies_mock_data.dart';

void main() {
  CompaniesEndpoint? sut;
  final String apiVersionPath = "/api/v3";

  group('getList method in', () {
    var basePath = "/companies/public_treasury/ethereum";
    group('CompaniesEndpoint test endpoint path creation', () {
      var sut = CompaniesEndpoint(
        HttpRequestServiceMock(
          statusCode : 200,
          body: CompaniesMockData.validResponseBody
        )
      );

      test('with required parameters', () async {
        await sut.getList(
          coinId: 'ethereum'
        );
        expect(sut.endpointPath, "$apiVersionPath$basePath");
      });
    });

    group('CompaniesEndpoint test endpoint response', () {
      test('with data in getting the correct response type', () async {
        sut = CompaniesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: CompaniesMockData.validResponseBody
          )
        );
        var result = await sut!.getList(
          coinId: 'ethereum'
        );

        expect(result.totalHoldings, 80026.1);
        expect(result.totalValueUsd, 152884386.10418233);
        expect(result.marketCapDominance, 0.07);
        expect(result.companies!.length, 3);
        var firstCompany = result.companies!.elementAt(0);
        var lastCompany = result.companies!.elementAt(2);
        expect(firstCompany.name, "Coinbase");
        expect(firstCompany.symbol, "NASDAQ: COIN");
        expect(firstCompany.country, "US");
        expect(firstCompany.totalHoldings, 48880);
        expect(firstCompany.totalEntryValueUsd, 165400000);
        expect(firstCompany.totalCurrentValueUsd, 93382085);
        expect(firstCompany.percentageOfTotalSupply, 0.041);
        
        expect(lastCompany.name, "Mogo Inc.");
        expect(lastCompany.symbol, "NASDAQ:MOGO");
        expect(lastCompany.country, "CA");
        expect(lastCompany.totalHoldings, 146);
        expect(lastCompany.totalEntryValueUsd, 405880);
        expect(lastCompany.totalCurrentValueUsd, 278923);
        expect(lastCompany.percentageOfTotalSupply, 0);
      });

      test('should still return a result for incomplete data format', () async {
        sut = CompaniesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: CompaniesMockData.responseBodyWithIncompleteKeys
          )
        );
        var result = await sut!.getList(
          coinId: 'ethereum'
        );

        expect(result.totalHoldings, 80026.1);
        expect(result.totalValueUsd, 152884386.10418233);
        expect(result.marketCapDominance, 0.07);
        expect(result.companies!.length, 3);
        var firstCompany = result.companies!.elementAt(0);
        var lastCompany = result.companies!.elementAt(2);
        expect(firstCompany.name, "Coinbase");
        expect(firstCompany.symbol, "NASDAQ: COIN");
        expect(firstCompany.country, "US");
        expect(firstCompany.totalHoldings, 48880);
        expect(firstCompany.totalEntryValueUsd, null);
        expect(firstCompany.totalCurrentValueUsd, null);
        expect(firstCompany.percentageOfTotalSupply, null);
        
        expect(lastCompany.name, null);
        expect(lastCompany.symbol, null);
        expect(lastCompany.country, null);
        expect(lastCompany.totalHoldings, 146);
        expect(lastCompany.totalEntryValueUsd, 405880);
        expect(lastCompany.totalCurrentValueUsd, 278923);
        expect(lastCompany.percentageOfTotalSupply, 0);
      });
    });

    group('CompaniesEndpoint test for error handling', () {
      test('should throw an exception for failed request', () async {
        sut = CompaniesEndpoint(
          HttpRequestServiceMock(
            statusCode : 500,
            body: CompaniesMockData.validResponseBody
          )
        );
        await expectLater(sut!.getList(
          coinId: 'ethereum'
        ), throwsA(isA<NetworkRequestException>()));
      });

      test('should return a FormatException when result is error or when parsing failed', () async {
        sut = CompaniesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: '''[{
    "error": "coin not found"
  }]'''
          )
        );
        await expectLater(sut!.getList(
          coinId: 'ethereum'
        ),throwsA(isA<DataParsingException>()));

        sut = CompaniesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: CompaniesMockData.responseBodyWithInvalidFormat
          )
        );
        await expectLater(sut!.getList(
          coinId: 'ethereum'
        ), throwsA(isA<DataParsingException>()));

        sut = CompaniesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: ""
          )
        );
        await expectLater(
          sut!.getList(
          coinId: 'ethereum'
        ),
          throwsA(isA<DataParsingException>())
        );
      });
    });
  });

}
