﻿using Bddify.Scanners.GwtAttributes;
using NUnit.Framework;

namespace $rootnamespace$.Bddify.Samples.Atm
{
    public class AccountHasSufficientFunds
    {
        private Card _card;
        private Atm _atm;

        void GivenTheAccountBalanceIs100()
        {
            _card = new Card(true, 100);
        }

        void AndGivenTheMachineContainsEnoughMoney()
        {
            _atm = new Atm(200);
        }

        void WhenTheAccountHolderRequests20()
        {
            _atm.RequestMoney(_card, 20);
        }

		// I am using StepText here to be able to print ATM; otherwise it would print that out as 'atm'
        [Then(StepText = "Then the ATM should dispense $20")]
        void ThenTheAtmShouldDispense20()
        {
            Assert.AreEqual(_atm.DispenseValue, 20);
        }

        void AndTheAccountBalanceShouldBe80()
        {
            Assert.AreEqual(_card.AccountBalance, 80);
        }

        void AndTheCardShouldBeReturned()
        {
            Assert.IsFalse(_atm.CardIsRetained);
        }
    }
}