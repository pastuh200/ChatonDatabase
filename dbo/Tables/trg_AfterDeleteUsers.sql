CREATE TRIGGER trg_AfterDeleteUsers
ON AspNetUsers
After DELETE
AS
BEGIN
	-- Log old values
	INSERT INTO UsersLog(eventTime, executerName, actionType, UserId, AccessFailedCount, ConcurrencyStamp, Email, EmailConfirmed, LockoutEnabled, LockoutEnd, NormalizedEmail, NormalizedUserName, PasswordHash, PhoneNumber, PhoneNumberConfirmed, SecurityStamp, TwoFactorEnabled, UserName, Picture)
	SELECT
		GETDATE(),
		SUSER_SNAME(),
		'DELETE',
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