//
//  XAccessibilityIdentifier.swift
//  
//
//  Created by Damon Ng on 29/9/22.
//

enum XAccessibilityIdentifier {
    enum EarlyWithdrawal {
        enum Form {
            static let withdrawalInfoContainerWrapper = "early.withdrawal.form.withdrawalInfoContainerWrapper"
            static let withdrawalInfoContainer = "early.withdrawal.form.withdrawalInfoContainer"
            static let withdrawalAmountLabel = "early.withdrawal.form.withdrawalAmountLabel"
            static let withdrawalAmount = "early.withdrawal.form.withdrawalAmount"
            static let withdrawalIsImmediateLabel = "early.withdrawal.form.withdrawalIsImmediateLabel"
            static let principalAmountLabel = "early.withdrawal.form.principalAmountLabel"
            static let principalAmount = "early.withdrawal.form.principalAmount"
            static let interestLabelWrapper = "early.withdrawal.form.interestLabelWrapper"
            static let interestLabel = "early.withdrawal.form.interestLabel"
            static let interestInfoButton = "early.withdrawal.form.interestInfoButton"
            static let interestAmount = "early.withdrawal.form.interestAmount"
            static let earlyWithdrawalFeeLabel = "early.withdrawal.form.earlyWithdrawalFeeLabel"
            static let earlyWithdrawalFeeAmount = "early.withdrawal.form.earlyWithdrawalFeeAmount"
            static let withdrawFromLabel = "early.withdrawal.form.withdrawFromLabel"
            static let timeDepositAccountName = "early.withdrawal.form.timeDepositAccountName"
            static let timeDepositReceiptInfoContainer = "early.withdrawal.form.timeDepositReceiptInfoContainer"
            static let timeDepositAccountNumber = "early.withdrawal.form.timeDepositAccountNumber"
            static let timeDepositReceiptNumber = "early.withdrawal.form.timeDepositReceiptNumber"
            static let timeDepositMaturityDate = "early.withdrawal.form.timeDepositMaturityDate"
            static let creditToLabel = "early.withdrawal.form.creditToLabel"
            static let creditToAccountName = "early.withdrawal.form.creditToAccountName"
            static let changeButton = "early.withdrawal.form.changeButton"
            static let creditToAccountStackView = "early.withdrawal.form.creditToAccountStackView"
            static let creditToAccountNumber = "early.withdrawal.form.creditToAccountNumber"
            static let usdAsNewCurrencyInfoTipCardView = "early.withdrawal.form.usdAsNewCurrencyInfoTipCardView"
            static let usdAsNewCurrencyInfoTipTextView = "early.withdrawal.form.usdAsNewCurrencyInfoTipTextView"
            static let nextButton = "early.withdrawal.form.nextButton"
            
            enum AccountSelection {
                static let contentView = "early.withdrawal.form.account.selection.contentView"
                static let topNotch = "early.withdrawal.form.account.selection.topNotch"
                static let titleLabel = "early.withdrawal.form.account.selection.titleLabel"
                
                enum AccountCell {
                    static let circleView = "early.withdrawal.form.account.selection.account.cell.circleView"
                    static let accountShortName = "early.withdrawal.form.account.selection.account.cell.accountShortName"
                    static let accountName = "early.withdrawal.form.account.selection.account.cell.accountName"
                    static let accountNumber = "early.withdrawal.form.account.selection.account.cell.accountNumber"
                    static let radioButton = "early.withdrawal.form.account.selection.account.cell.radioButton"
                }
            }
            
            enum AccountOpening {
                static let topNotch = "early.withdrawal.form.account.opening.topNotch"
                static let bannerImage = "early.withdrawal.form.account.opening.bannerImage"
                static let titleLabel = "early.withdrawal.form.account.opening.titleLabel"
                static let descriptionText = "early.withdrawal.form.account.opening.descriptionText"
                static let openAccountButton = "early.withdrawal.form.account.opening.openAccountButton"
            }
            
            enum Apply360Account {
                static let headerText = "early.withdrawal.form.apply.360.account.headerText"
                static let threeSixtyAccountImage = "early.withdrawal.form.apply.360.account.threeSixtyAccountImage"
            }
        }
        
        enum ReviewAndConfirm {
            static let reviewAndConfirmTitle = "early.withdrawal.review.and.confirm.reviewAndConfirmTitle"
            static let withdrawalInfoContainerWrapper = "early.withdrawal.review.and.confirm.withdrawalInfoContainerWrapper"
            static let withdrawalInfoContainer = "early.withdrawal.review.and.confirm.withdrawalInfoContainer"
            static let withdrawalAmountLabel = "early.withdrawal.review.and.confirm.withdrawalAmountLabel"
            static let withdrawalAmount = "early.withdrawal.review.and.confirm.withdrawalAmount"
            static let principalAmountLabel = "early.withdrawal.review.and.confirm.principalAmountLabel"
            static let principalAmount = "early.withdrawal.review.and.confirm.principalAmount"
            static let interestLabelWrapper = "early.withdrawal.review.and.confirm.interestLabelWrapper"
            static let interestLabel = "early.withdrawal.review.and.confirm.interestLabel"
            static let interestInfoButton = "early.withdrawal.review.and.confirm.interestInfoButton"
            static let interestAmount = "early.withdrawal.review.and.confirm.interestAmount"
            static let earlyWithdrawalFeeLabel = "early.withdrawal.review.and.confirm.earlyWithdrawalFeeLabel"
            static let earlyWithdrawalFeeAmount = "early.withdrawal.review.and.confirm.earlyWithdrawalFeeAmount"
            static let withdrawFromLabel = "early.withdrawal.review.and.confirm.withdrawFromLabel"
            static let timeDepositAccountName = "early.withdrawal.review.and.confirm.timeDepositAccountName"
            static let timeDepositReceiptInfoContainer = "early.withdrawal.review.and.confirm.timeDepositReceiptInfoContainer"
            static let timeDepositAccountNumber = "early.withdrawal.review.and.confirm.timeDepositAccountNumber"
            static let timeDepositReceiptNumber = "early.withdrawal.review.and.confirm.timeDepositReceiptNumber"
            static let timeDepositMaturityDate = "early.withdrawal.review.and.confirm.timeDepositMaturityDate"
            static let creditToLabel = "early.withdrawal.review.and.confirm.creditToLabel"
            static let creditToAccountName = "early.withdrawal.review.and.confirm.creditToAccountName"
            static let creditToAccountStackView = "early.withdrawal.review.and.confirm.creditToAccountStackView"
            static let creditToAccountNumber = "early.withdrawal.review.and.confirm.creditToAccountNumber"
            static let usdAsNewCurrencyInfoTipCardView = "early.withdrawal.review.and.confirm.usdAsNewCurrencyInfoTipCardView"
            static let usdAsNewCurrencyInfoTipTextView = "early.withdrawal.review.and.confirm.usdAsNewCurrencyInfoTipTextView"
            static let agreementText = "early.withdrawal.review.and.confirm.agreementText"
            static let slideToWithdrawButton = "early.withdrawal.review.and.confirm.slideToWithdrawButton"
        }
        
        enum Success {
            static let topSectionImage = "early.withdrawal.success.topSectionImage"
            static let headerText = "early.withdrawal.success.headerText"
            static let withdrawalAmountLabel = "early.withdrawal.success.withdrawalAmountLabel"
            static let withdrawalAmount = "early.withdrawal.success.withdrawalAmount"
            static let creditToLabel = "early.withdrawal.success.creditToLabel"
            static let creditToAccountName = "early.withdrawal.success.creditToAccountName"
            static let creditToAccountNumber = "early.withdrawal.success.creditToAccountNumber"
            static let viewMyBalanceButton = "early.withdrawal.success.viewMyBalanceButton"
            static let backToHomeButton = "early.withdrawal.success.backToHomeButton"
        }
        
        enum Pending {
            static let topSectionImage = "early.withdrawal.pending.topSectionImage"
            static let headerText = "early.withdrawal.pending.headerText"
            static let descriptionText = "early.withdrawal.pending.descriptionText"
            static let backToHomeButton = "early.withdrawal.pending.backToHomeButton"
        }
        
        enum Error {
            static let topSectionImage = "early.withdrawal.error.topSectionImage"
            static let headerText = "early.withdrawal.error.headerText"
            static let descriptionText = "early.withdrawal.error.descriptionText"
            static let backToHomeButton = "early.withdrawal.error.backToHomeButton"
        }
    }
}
