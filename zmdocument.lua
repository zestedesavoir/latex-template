function licence (value)
	local knowLicense_ = {'cc-by', 'cc-by-nc', 'cc-by-nc-nd', 'cc-by-nc-sa', 'cc-by-nd', 'cc-by-sa'}
	local result_ = ''

	local found_ = false
	for _, v in ipairs (knowLicense_) do
	  if v == string.lower (value) then
	    found_ = true
	    result_ = v
	    break
	  end
	end

	if found_ then
		local license_ = string.match (result_, '^cc%-(.*)$')
		tex.sprint ("\\gdef\\@licence{\\externalImageLink{\\addLicenseImg{" .. result_ .. "}}{https://creativecommons.org/licenses/".. license_ .."/4.0/legalcode}}")
	else
		tex.sprint ("\\gdef\\@licence{Licence : " .. value .. "}")
	end
end