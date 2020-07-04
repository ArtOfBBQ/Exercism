local BankAccount = {}

function BankAccount.new(_)

    local account = {}
    local balance = 0
    local closed = false
    
    function account.balance(_)

        return balance

    end
    
    function account.deposit(_, amount)

        assert(amount > 0, "Can't deposit 0 or less. Got: " .. amount)
        assert(closed == false, "Can't deposit to a closed account")

        balance = balance + amount

    end

    function account.withdraw(_, amount)

        assert(amount > 0, "Can't withdraw 0 or less. Got: " .. amount)
        assert(closed == false, "Can't withdraw from closed account.")
        assert(
            balance - amount >= 0,
            "Can't withdraw " .. amount .. ", balance is " .. balance)

        balance = balance - amount

    end

    function account.close(_)

        closed = true

    end

    return account

end

return BankAccount

