Name: hyphen-el
Summary: Greek hyphenation rules
%define upstreamid 20051018
Version: 0.%{upstreamid}
Release: 2%{?dist}
Source: http://ftp.services.openoffice.org/pub/OpenOffice.org/contrib/dictionaries/hyph_el_GR.zip
Group: Applications/Text
URL: http://wiki.services.openoffice.org/wiki/Dictionaries
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
License: LGPLv2+
BuildArch: noarch

Requires: hyphen

%description
Greek hyphenation rules.

%prep
%setup -q -c

%build

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT/%{_datadir}/hyphen
cp -p *.dic $RPM_BUILD_ROOT/%{_datadir}/hyphen

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root,-)
%doc README_hyph_el_GR.txt
%{_datadir}/hyphen/*

%changelog
* Tue Feb 24 2009 Fedora Release Engineering <rel-eng@lists.fedoraproject.org> - 0.20051018-2
- Rebuilt for https://fedoraproject.org/wiki/Fedora_11_Mass_Rebuild

* Mon Jan 05 2008 Caolan McNamara <caolanm@redhat.com> - 0.20051018-1
- initial version
