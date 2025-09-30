CREATE TRIGGER trg_AfterUpdateUsers
ON AspNetUsers
After UPDATE
AS
BEGIN
	-- Log new values
    INSERT INTO UsersLog(eventTime, executerName, actionType, UserId, AccessFailedCount, ConcurrencyStamp, Email, EmailConfirmed, LockoutEnabled, LockoutEnd, NormalizedEmail, NormalizedUserName, PasswordHash, PhoneNumber, PhoneNumberConfirmed, SecurityStamp, TwoFactorEnabled, UserName, Picture)
    SELECT
        GETDATE(),
        SUSER_SNAME(),
        'UPDATE_NEW',
        i.Id,
        i.AccessFailedCount,
        i.ConcurrencyStamp,
        i.Email,
        i.EmailConfirmed,
        i.LockoutEnabled,
        i.LockoutEnd,
        i.NormalizedEmail,
        i.NormalizedUserName,
        i.PasswordHash,
        i.PhoneNumber,
        i.PhoneNumberConfirmed,
        i.SecurityStamp,
        i.TwoFactorEnabled,
        i.UserName,
        i.Picture
    FROM INSERTED i;

    -- Log old values
    INSERT INTO UsersLog(eventTime, executerName, actionType, UserId, AccessFailedCount, ConcurrencyStamp, Email, EmailConfirmed, LockoutEnabled, LockoutEnd, NormalizedEmail, NormalizedUserName, PasswordHash, PhoneNumber, PhoneNumberConfirmed, SecurityStamp, TwoFactorEnabled, UserName, Picture)
    SELECT
        GETDATE(),
        SUSER_SNAME(),
        'UPDATE_OLD',
        d.Id,
        d.AccessFailedCount,
        d.ConcurrencyStamp,
        d.Email,
        d.EmailConfirmed,
        d.LockoutEnabled,
        d.LockoutEnd,
        d.NormalizedEmail,
        d.NormalizedUserName,
        d.PasswordHash,
        d.PhoneNumber,
        d.PhoneNumberConfirmed,
        d.SecurityStamp,
        d.TwoFactorEnabled,
        d.UserName,
        d.Picture
    FROM DELETED d;
END
