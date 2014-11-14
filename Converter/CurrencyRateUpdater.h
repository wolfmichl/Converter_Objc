#import <Foundation/Foundation.h>

@class CurrencyRateUpdater;


@protocol CurrencyRateUpdaterDelegate <NSObject>
- (void)currencyRateUpdater:(CurrencyRateUpdater *)updater didUpdateRate:(NSNumber *)rate forCurrency:(NSString *)isoCode;
@end

@interface CurrencyRateUpdater : NSObject

@property (weak) id<CurrencyRateUpdaterDelegate> delegate;

- (void)updateConversionRateForCurrencyFrom:(NSString *)from toCurrency:(NSString *)isoCode;

@end
